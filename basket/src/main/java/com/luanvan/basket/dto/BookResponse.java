package com.luanvan.basket.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import  java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookResponse {
  private Integer id;
  private String name;
  private long price;
  private String image;

}

