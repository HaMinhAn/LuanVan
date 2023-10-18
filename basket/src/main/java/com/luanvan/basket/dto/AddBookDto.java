package com.luanvan.basket.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AddBookDto {
  private String user;
  private String name;
  private String image;
  private int price;
}
