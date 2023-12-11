package com.example.userService.mappers;

import com.example.userService.data.User;
import com.example.userService.model.RegisterDto;
import com.example.userService.model.UserDto;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class UserMapper {

  public UserDto toUserDto(User user) {
    UserDto userDto = UserDto.builder()
            .username(user.getUsername())
            .id(user.getId())
            .name(user.getName())
            .password(user.getPassword())
            .address(user.getAddress())
            .build();
    return userDto;
  }

  public User registerToUser(RegisterDto signUpDto) {
    User user = new User();
    user.setAge(signUpDto.getAge());
    user.setPassword(signUpDto.getPassword());
    user.setUsername(signUpDto.getUsername());
    user.setPhoneNumber(signUpDto.getPhoneNumber());
    user.setSex(signUpDto.getSex());
    user.setAddress(signUpDto.getAddress());
    user.setName(signUpDto.getName());
    user.setAddress(signUpDto.getAddress());
    return user;
  }
}
