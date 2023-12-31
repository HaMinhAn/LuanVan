package com.email.luanvan.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MailOrder {
  private String email;
  private String no;
  private long price;
  private long phoneNumber;
  private String address;
  private String name;
  private List<OrderItems> items;
}
