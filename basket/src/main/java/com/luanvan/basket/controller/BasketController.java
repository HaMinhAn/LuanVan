package com.luanvan.basket.controller;

import com.luanvan.basket.dto.AddBookDto;
import com.luanvan.basket.models.Basket;
import com.luanvan.basket.models.BasketItem;
import com.luanvan.basket.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("/api/basket")
public class BasketController {
  @Autowired
  private BasketService basketService;

  @GetMapping("/{id}")
  public ResponseEntity<Basket> getBasket(@PathVariable String id) throws ExecutionException, InterruptedException {
    return ResponseEntity.ok(basketService.getBasket(id));
  }

  @PostMapping("/add")
  @KafkaListener(topics = "cart-product", groupId = "add-cart")
  public void addToBasket(@RequestBody AddBookDto req){
    basketService.add(req);
  }

  @PutMapping("/remove")
  public void removeItem(@RequestBody AddBookDto req){
    basketService.remove(req);
  }
  @DeleteMapping("/remove/item/{id}")
  public String removeItem(@PathVariable int id, @RequestParam String name) {
    return basketService.removeItem(id,name);
  }
  @DeleteMapping("/delete/{name}")
  public String deleteBasket(@PathVariable String name) {
    return basketService.delete(name);
  }
}
