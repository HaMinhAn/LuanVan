package com.luanvan.oderService.service;


import com.luanvan.oderService.model.AppException;
import com.luanvan.oderService.model.Order;
import com.luanvan.oderService.model.OrderItem;
import com.luanvan.oderService.model.PaymentMethod;
import com.luanvan.oderService.repositories.OrderItemsRepository;
import com.luanvan.oderService.repositories.OrderRepository;
import com.luanvan.oderService.dto.OrderRequest;
import com.luanvan.oderService.repositories.PaymentMethodRepository;
import com.luanvan.oderService.utils.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

@Service
public class OrderService {
  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private OrderItemsRepository orderItemsRepository;
  @Autowired
  private PaymentMethodRepository paymentMethodRepository;
  @Autowired
  private KafkaTemplate<String, String> toBasket;

  public List<Order> getListOrder() {
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
      if (a.getId() == (targetId)) {
        return a;
      }
    } // Trả về phần tử có id khớp hoặc null nếu không tìm thấy
    return null;
  }

  public long totalPriceCal(Set<OrderItem> orderItems){
    long totalPrice = 0;
    for(OrderItem orderItem : orderItems){
      totalPrice += orderItem.getPrice() * orderItem.getQuantity();
    }
    return totalPrice;

  }

  public void addOrder(OrderRequest orderRequest) {
    Optional<PaymentMethod> paymentMethod = paymentMethodRepository.findById(orderRequest.getPaymentMethod());
    Order order = Order.builder()
            .address(orderRequest.getAddress())
            .paymentMethod(paymentMethod.get())
            .createdDate(LocalDateTime.now())
            .totalPrice(totalPriceCal(orderRequest.getItems()))
            .isPaid(orderRequest.isPaid())
            .username(orderRequest.getName())
            .email(orderRequest.getEmail())
            .status(OrderStatus.PENDING)
            .no(UUID.randomUUID().toString())
            .phoneNumber(orderRequest.getPhoneNumber()).build();
    orderRepository.save(order);

    Optional<Order> orderOptional = orderRepository.findByNo(order.getNo());
    System.out.println(orderOptional.get());
    for(OrderItem orderItem : orderRequest.getItems()){
      orderItem.setOder(orderOptional.get());
      orderItemsRepository.save(orderItem);
    }
    toBasket.send("sendmail", orderRequest.getEmail());
    toBasket.send("cart-order", orderRequest.getUsername());
  }

  public void updateOrder(OrderRequest orderRequest) {
    Optional<Order> order = orderRepository.findByUsername(orderRequest.getUsername());
    if (order.isEmpty()) {
      throw new AppException("Không tìm thấy hóa đơn", HttpStatus.NOT_FOUND);
    }
    Order order1 = order.get();
    order1.setUsername(orderRequest.getUsername());

    orderRepository.save(order1);
  }

  public void deleteOrder(Integer id) {
    Optional<Order> orderOptional = orderRepository.findById(id);
    if (orderOptional.isEmpty()) {
      throw new AppException("không tìm thấy hóa đơn", HttpStatus.NOT_FOUND);
    }
    orderRepository.delete(orderOptional.get());
  }

  public void testKafka(String name) {
    System.out.println("Order delete " + name);
    toBasket.send("cart-order", name);
  }
}
