package com.luanvan.webservice.command.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UpdateBookRequest {
  private String name;

  private long price;

  private int quantity;
  private  String description;
  private Integer idManufacturer;
  private Integer idLanguage;
  private Integer idCategory;
  private Integer idAuthor;
  private List<CreatePicture> list;
}
