package com.example.userService.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class UpdateUserRequest {
  private String name;
  private String phoneNumber;
  private Boolean sex;
  private int age;
  private String address;
  private String dateTime;
}
