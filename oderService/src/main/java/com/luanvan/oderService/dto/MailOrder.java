package com.luanvan.oderService.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
}
