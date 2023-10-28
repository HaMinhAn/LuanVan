package com.luanvan.webservice.command.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthorRequest {
  private Integer id;
  private String name;
  private LocalDateTime DOB;
  private String story;
}
