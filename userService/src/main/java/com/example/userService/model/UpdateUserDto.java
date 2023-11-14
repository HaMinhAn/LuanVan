package com.example.userService.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UpdateUserDto {
  private String username;
  private String password;
  private String name;
  private String phoneNumber;
  private Boolean sex;
  private int age;
  private String address;
  private LocalDateTime dob;
}
