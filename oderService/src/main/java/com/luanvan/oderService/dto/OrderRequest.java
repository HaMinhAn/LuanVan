package com.luanvan.oderService.dto;

import com.luanvan.oderService.model.OrderItem;
import com.luanvan.oderService.model.PaymentMethod;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Set;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderRequest {
  private String username;
  private String name;
  private Set<OrderItem> items;
  private String address;
  private Integer paymentMethod;
  private long phoneNumber;
  private String email;
  private boolean paid;
}
