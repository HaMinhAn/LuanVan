package com.luanvan.oderService.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.luanvan.oderService.dto.MailOrder;
import com.luanvan.oderService.dto.MailStatus;
import com.luanvan.oderService.dto.OrderItems;
import com.luanvan.oderService.dto.UpdateStatusOrder;
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

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
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
  @Autowired
  private KafkaTemplate<String, MailStatus> toMailStatus;
  @Autowired
  private KafkaTemplate<String, MailOrder> toMail;

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

  public long totalPriceCal(Set<OrderItem> orderItems) {
    long totalPrice = 0;
    for (OrderItem orderItem : orderItems) {
      totalPrice += orderItem.getPrice() * orderItem.getQuantity();
    }
    return totalPrice;

  }

  public void addOrder(OrderRequest orderRequest) {
    Optional<PaymentMethod> paymentMethod = paymentMethodRepository.findById(orderRequest.getPaymentMethod());
    Order order = Order.builder()
            .address(orderRequest.getAddress())
            .receiver(orderRequest.getName())
            .paymentMethod(paymentMethod.get())
            .createdDate(LocalDateTime.now())
            .totalPrice(totalPriceCal(orderRequest.getItems()))
            .isPaid(orderRequest.isPaid())
            .username(orderRequest.getUsername())
            .email(orderRequest.getEmail())
            .status(OrderStatus.PENDING)
            .no(UUID.randomUUID().toString())
            .phoneNumber(orderRequest.getPhoneNumber()).build();
    orderRepository.save(order);

    Optional<Order> orderOptional = orderRepository.findByNo(order.getNo());
    System.out.println(orderOptional.get());
    for (OrderItem orderItem : orderRequest.getItems()) {
      orderItem.setOder(orderOptional.get());
      orderItemsRepository.save(orderItem);
    }
    Order order1 = orderOptional.get();
    List<OrderItems> orderItemsList =new ArrayList<>();
    for (OrderItem item: orderRequest.getItems()
         ) {
      OrderItems orderItems = OrderItems.builder()
              .image(item.getImage())
              .quantity(item.getQuantity())
              .price(item.getPrice())
              .name(item.getName())
              .build();
      orderItemsList.add(orderItems);
    }
    MailOrder mailOrder = MailOrder
            .builder()
            .no(order1.getNo())
            .price(order1.getTotalPrice())
            .phoneNumber(order1.getPhoneNumber())
            .name(order1.getReceiver())
            .email(order1.getEmail())
            .address(order1.getAddress())
            .items(orderItemsList)
            .build();
    toMail.send("sendmail", mailOrder);
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

  public void updateStatusOrder(UpdateStatusOrder updateStatusOrder) {
    Optional<Order> orderOptional = orderRepository.findById(updateStatusOrder.getId());
    System.out.println(updateStatusOrder);
    if (orderOptional.isEmpty()) {
      throw new AppException("Không tìm thấy order", HttpStatus.NOT_FOUND);
    }
    Order order = orderOptional.get();
    if (order.getStatus() == OrderStatus.RECEIVED) {
      throw new AppException("Không thể cập nhật trạng thái giao dịch này", HttpStatus.BAD_REQUEST);
    }
    MailStatus status = new MailStatus();
    status.setNo(order.getNo());
    switch (updateStatusOrder.getState()) {
      case 0:
        order.setStatus(OrderStatus.CANCEL);
        status.setOrderStatus(OrderStatus.CANCEL.name());
        break;
      case 1:
        order.setStatus(OrderStatus.SHIPPING);
        status.setOrderStatus(OrderStatus.SHIPPING.name());
        break;
      case 2:
        order.setStatus(OrderStatus.RECEIVED);
        status.setOrderStatus(OrderStatus.RECEIVED.name());
        order.setPaid(true);
        break;
      default:
        throw new AppException("Không thể cập nhật trạng thái giao dịch này", HttpStatus.BAD_REQUEST);
    }
    status.setUser(updateStatusOrder.getUser());
    if( (updateStatusOrder.getUser() != "admin" && order.getStatus() == OrderStatus.CANCEL)){
      status.setEmail("haminhan234@gmail.com");
      toMailStatus.send("updateStatus", status);
    } else {
      status.setEmail(updateStatusOrder.getEmail());

      toMailStatus.send("updateStatus", status);
    }
    orderRepository.save(order);
  }

  public List<Order> getListOrderByStatus(int status) {
    List<Order> orders;
    switch (status) {
      case 0:
        orders = orderRepository.findAllByStatus(OrderStatus.CANCEL);
        break;
      case 3:
        orders = orderRepository.findAllByStatus(OrderStatus.PENDING);
        break;
      case 1:
        orders = orderRepository.findAllByStatus(OrderStatus.SHIPPING);
        break;
      case 2:
        orders = orderRepository.findAllByStatus(OrderStatus.RECEIVED);
        break;
      default:
        throw new AppException("Trạng thái không hợp lệ", HttpStatus.BAD_REQUEST);
    }
    return orders;
  }

  public List<Order> getListOrderByUser(String user) {
    Optional<List<Order>> orders = orderRepository.findAllByUsername(user);
    if (orders.isEmpty()) {
      return null;
    }
    return orders.get();
  }

  public Map<String, BigDecimal> getOrdersOrderByCreateDate() {
    Map<String, BigDecimal> revenueByMonth = new HashMap<>();
    List<Order> allOrders = orderRepository.findAllByStatusAndIsPaid(OrderStatus.RECEIVED, true);
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS");

    for (Order order : allOrders) {
      // Chuyển đổi LocalDateTime thành String sử dụng DateTimeFormatter
      String orderDateString = order.getCreatedDate().format(formatter);

      // Parse String thành LocalDateTime
      LocalDateTime orderDate = LocalDateTime.parse(orderDateString, formatter);

      // Tiếp tục xử lý như trước
      String monthYear = orderDate.getMonth().toString() + " " + orderDate.getYear();
      revenueByMonth.merge(monthYear, new BigDecimal(order.getTotalPrice()), BigDecimal::add);
    }
    return revenueByMonth;
  }
}
