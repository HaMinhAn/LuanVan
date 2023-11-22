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

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/order")
public class OrderController {
  @Autowired
  private OrderService orderService;
  @GetMapping
  public ResponseEntity<List<Order>> orderList(){
    return ResponseEntity.ok(orderService.getListOrder());
  }

  @GetMapping("/createDate")
  public Map<String, BigDecimal> getOrdersOrderByCreateDate(){
    return orderService.getOrdersOrderByCreateDate();
  }
  @GetMapping("/private/{user}")
  public ResponseEntity<List<Order>> orderListByUser(@PathVariable String user){
    return ResponseEntity.ok(orderService.getListOrderByUser(user));
  }
  @PostMapping
  public ResponseEntity createOrder(@RequestBody OrderRequest orderRequest){
    orderService.addOrder(orderRequest);
    return ResponseEntity.ok("Tạo order thành công ");
  }
  @GetMapping("/{status}")
  public List<Order> getOrderByStatus(@PathVariable int status){
    return orderService.getListOrderByStatus(status);
  }
  @PutMapping("/{id}/{state}")
  public ResponseEntity updateStatusOrder(@PathVariable int id, @PathVariable int state){
    orderService.updateStatusOrder(id, state);
    return ResponseEntity.ok("Cập nhật trạng thái đơn hàng thành công");
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
