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
  private String user;
  private String name;
  private LocalDateTime createdDate;

  private String image;
  private String items;

  private String address;

  private long price;
  private String paymentMethod;
  private boolean isPaid;
}
