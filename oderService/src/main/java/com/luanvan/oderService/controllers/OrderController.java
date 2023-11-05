package com.luanvan.oderService.controllers;

import com.luanvan.oderService.dto.OrderRequest;
import com.luanvan.oderService.model.Order;
import com.luanvan.oderService.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class OrderController {
  @Autowired
  private OrderService orderService;
  @GetMapping
  public ResponseEntity<List<Order>> orderList(){
    return ResponseEntity.ok(orderService.getListOrder());
  }

  @PostMapping
  public ResponseEntity createOrder(@RequestBody OrderRequest orderRequest){
    orderService.addOrder(orderRequest);
    return ResponseEntity.ok("Tạo order thành công ");
  }

  @PostMapping("/cart/delete/{username}")
  public ResponseEntity<String> payment(@PathVariable String username){
    System.out.println(username);
    orderService.testKafka(username);
    return ResponseEntity.ok("Thanh toan thanh cong");
  }


  @DeleteMapping("/{id}")
  public ResponseEntity deleteOrder(@PathVariable Integer id){
    orderService.deleteOrder(id);
    return  ResponseEntity.ok("Xóa tác giả thành công ");
  }

  @PutMapping
  public ResponseEntity updateOrder(@RequestBody OrderRequest orderRequest){
    orderService.updateOrder(orderRequest);
    return ResponseEntity.ok("Cập nhật tác giả thành công ");
  }
}
