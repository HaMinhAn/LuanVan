package com.luanvan.basket.service;

import com.luanvan.basket.dto.AddBookDto;
import com.luanvan.basket.dto.AppException;
import com.luanvan.basket.models.Basket;
import com.luanvan.basket.models.BasketItem;
import com.luanvan.basket.repository.BasketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ExecutionException;

@Service
public class BasketService {

  @Autowired
  private BasketRepository basketRepository;


  public Basket getBasket(String user) throws ExecutionException, InterruptedException {
    System.out.println(user);
    Optional<Basket> existingBasket = basketRepository.findById(user);
    return existingBasket.isPresent() && existingBasket.get() != null ? existingBasket.get() : null;
  }

  public BasketItem findBasketItemById(Set<BasketItem> basketItems, String targetId) {
    for (BasketItem a :
            basketItems) {
      if (a.getName().equalsIgnoreCase(targetId)) {
        return a;
      }
    } // Trả về phần tử có id khớp hoặc null nếu không tìm thấy
    return null;
  }

  public BasketItem findBasketItemById(Set<BasketItem> basketItems, int targetId) {
    for (BasketItem a :
            basketItems) {
      if (a.getId() ==(targetId)) {
        return a;
      }
    } // Trả về phần tử có id khớp hoặc null nếu không tìm thấy
    return null;
  }

  public void add(AddBookDto req) {
    Optional<Basket> existingBasket = basketRepository.findById(req.getUser());
    if (existingBasket.isEmpty()) {
      Basket basket = Basket.builder().username(req.getUser()).totalPrice(req.getPrice()).items(new HashSet<>()).build();
      basketRepository.save(basket);
      existingBasket = basketRepository.findById(req.getUser());
    }

    Set<BasketItem> basketItems = new HashSet<>();
    if (existingBasket.get().getItems() == null || existingBasket.get().getItems().isEmpty()) {
      basketItems.add(new BasketItem(basketItems.size(), req.getName(), req.getPrice(), 1, req.getImage()));
    } else {
      basketItems = existingBasket.get().getItems();
      BasketItem basketItem = findBasketItemById(existingBasket.get().getItems(), req.getName());
      if (basketItem != null) {
        basketItems.remove(basketItem);
        basketItem.setQuantity(basketItem.getQuantity() + 1);
        basketItems.add(basketItem);
        List<BasketItem> basketList = new ArrayList<>(basketItems);

        // Sử dụng Comparator để sắp xếp danh sách theo ID tăng dần
        Collections.sort(basketList, Comparator.comparing(BasketItem::getId));

        // Chuyển danh sách trở lại thành một Set
        basketItems = new LinkedHashSet<>(basketList);

      } else {
        basketItems.add(new BasketItem(basketItems.size(), req.getName(), req.getPrice(), 1, req.getImage()));
      }

    }
    long total = 0;
    for (BasketItem a :
            basketItems) {
      total += a.getPrice() * a.getQuantity();
    }
    existingBasket.get().setTotalPrice(total);
    existingBasket.get().setItems(basketItems);
    basketRepository.save(existingBasket.get());
  }

  public String delete(String name) {
    basketRepository.deleteById(name);

    return String.format("%s is remove", name);
  }

  public void remove(AddBookDto req) {
    Optional<Basket> existingBasket = basketRepository.findById(req.getUser());
    if (existingBasket.isEmpty()) {
      throw new AppException("Khong co gio hang", HttpStatus.NOT_FOUND);
    }
    Basket basket = existingBasket.get();
    BasketItem basketItem = findBasketItemById(basket.getItems(), req.getName());
    basketItem.setQuantity(basketItem.getQuantity() - 1);
    basket.setTotalPrice(basket.getTotalPrice() - req.getPrice());
    if (basketItem.getQuantity() == 0) {
      basketItem.setQuantity(basketItem.getQuantity() + 1);
      basket.getItems().remove(basketItem);
    }
    basketRepository.save(basket);
  }

  public String removeItem(int id, String name) {
    Optional<Basket> existingBasket = basketRepository.findById(name);
    if (existingBasket.isEmpty()) {
      throw new AppException("Khong co gio hang", HttpStatus.NOT_FOUND);
    }
    Set<BasketItem> basketItems = existingBasket.get().getItems();
    BasketItem basketItem = findBasketItemById(basketItems,id);
    if(basketItem != null){
      basketItems.remove(basketItem);
    }else {
      throw new AppException("Sản phẩm không có trong giỏ hàng", HttpStatus.NOT_FOUND);
    }
    existingBasket.get().setItems(basketItems);
    existingBasket.get().setTotalPrice(existingBasket.get().getTotalPrice()- basketItem.getPrice()* basketItem.getQuantity());
    basketRepository.save(existingBasket.get());
    return String.format("%s đã được xóa", name);
  }
  @KafkaListener(topics = "cart-order", containerFactory = "kafkaListenerContainerFactory")
  public String printProduct(String receiveBookDTO){
    delete(receiveBookDTO);
    System.out.println(receiveBookDTO);
    return receiveBookDTO;
  }
}
