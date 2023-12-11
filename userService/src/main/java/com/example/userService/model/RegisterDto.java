package com.example.userService.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class RegisterDto {
  private String username;
  private String password;
  private String name;
  private String phoneNumber;
  private String dateTime;
  private Boolean sex;
  private int age;
  private String address;
}
