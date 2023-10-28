package com.luanvan.oderService.service;


import com.luanvan.oderService.model.AppException;
import com.luanvan.oderService.model.Order;
import com.luanvan.oderService.model.OrderItem;
import com.luanvan.oderService.repositories.OrderRepository;
import com.luanvan.oderService.dto.OrderRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class OrderService {
  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private KafkaTemplate<String, String> toBasket;
  public List<Order> getListOrder()
  {
    return orderRepository.findAll();
  }



  public OrderItem findOrderItemById(Set<OrderItem> orderItems, String targetId) {
    for (OrderItem a :
            orderItems) {
      if (a.getName().equalsIgnoreCase(targetId)) {
        return a;
      }
    } // Trả về phần tử có id khớp hoặc null nếu không tìm thấy
    return null;
  }

  public OrderItem findOrderItemById(Set<OrderItem> orderItems, int targetId) {
    for (OrderItem a :
            orderItems) {
      if (a.getId() ==(targetId)) {
        return a;
      }
    } // Trả về phần tử có id khớp hoặc null nếu không tìm thấy
    return null;
  }
  
  public void addOrder(OrderRequest orderRequest){
    Optional<Order> existingOrder = orderRepository.findByUsername(orderRequest.getUser());
    if (existingOrder.isEmpty()) {
      Order order = Order.builder().username(orderRequest.getUser()).totalPrice(orderRequest.getPrice()).items(new HashSet<>()).build();
      orderRepository.save(order);
      existingOrder = orderRepository.findByUsername(orderRequest.getUser());
    }

    Set<OrderItem> orderItems = new HashSet<>();
    if (existingOrder.get().getItems() == null || existingOrder.get().getItems().isEmpty()) {
      orderItems.add(OrderItem.builder().quantity(1).name(orderRequest.getName()).url(orderRequest.getImage()).oder(existingOrder.get()).price(orderRequest.getPrice()).build());
    } else {
      orderItems = existingOrder.get().getItems();
      OrderItem orderItem = findOrderItemById(existingOrder.get().getItems(), orderRequest.getUser());
      if (orderItem != null) {
        orderItems.remove(orderItem);
        orderItem.setQuantity(orderItem.getQuantity() + 1);
        orderItems.add(orderItem);
        List<OrderItem> orderList = new ArrayList<>(orderItems);

        // Sử dụng Comparator để sắp xếp danh sách theo ID tăng dần
        Collections.sort(orderList, Comparator.comparing(OrderItem::getId));

        // Chuyển danh sách trở lại thành một Set
        orderItems = new LinkedHashSet<>(orderList);

      } else {
        orderItems.add( OrderItem.builder().quantity(1).name(orderRequest.getName()).url(orderRequest.getImage()).oder(existingOrder.get()).price(orderRequest.getPrice()).build());
      }

    }
    long total = 0;
    for (OrderItem a :
            orderItems) {
      total += a.getPrice() * a.getQuantity();
    }
    existingOrder.get().setTotalPrice(total);
    existingOrder.get().setItems(orderItems);
    orderRepository.save(existingOrder.get());
    toBasket.send("cart-order", existingOrder.get().getUsername());
  }
  public void updateOrder(OrderRequest orderRequest){
    Optional<Order> order = orderRepository.findByUsername(orderRequest.getUser());
    if(order.isEmpty()){
      throw new AppException("Không tìm thấy hóa đơn", HttpStatus.NOT_FOUND);
    }
    Order order1 = order.get();
    order1.setUsername(orderRequest.getUser());

    orderRepository.save(order1);
  }

  public void deleteOrder(Integer id){
    Optional<Order> orderOptional = orderRepository.findById(id);
    if(orderOptional.isEmpty()){
      throw new AppException("không tìm thấy hóa đơn", HttpStatus.NOT_FOUND);
    }
    orderRepository.delete(orderOptional.get());
  }

  public void testKafka(String name){
    toBasket.send("cart-order", name);
  }
}
