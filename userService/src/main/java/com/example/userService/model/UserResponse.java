package com.example.userService.model;


import lombok.Builder;
import lombok.Data;

import javax.persistence.Column;


@Data
@Builder
public class UserResponse {

  private String name;

  private int age;

  private Boolean sex;

  private int DOB;
  private String phoneNumber;
  private String address;


}
