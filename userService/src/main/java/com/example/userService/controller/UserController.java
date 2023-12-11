package com.example.userService.controller;

import java.net.URI;
import java.text.DateFormat;
import java.util.Date;

import com.example.userService.model.CredentialsDto;
import com.example.userService.model.RegisterDto;
import com.example.userService.model.UpdateUserDto;
import com.example.userService.model.UpdateUserRequest;
import com.example.userService.model.UserDto;
import com.example.userService.model.UserResponse;
import com.example.userService.service.JwtService;
import com.example.userService.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/users")
public class UserController {
  @Autowired
  private UserService userService;
  @Autowired
  private JwtService jwtService;
  @GetMapping("{id}")
  public ResponseEntity<UserDto> getInfor(@PathVariable int id) {
    return ResponseEntity.ok(userService.getEmail(id));
  }


  @PutMapping("/{id}")
  public void updateInfor(@PathVariable int id, @RequestBody UpdateUserDto updateUserDto){
    System.out.println(updateUserDto.getName());
    userService.updateInfor(id, updateUserDto);
  }

  @PutMapping("/pass/{id}")
  public void updatePass(@PathVariable int id, @RequestParam String pass){
    userService.updateUserPass(id, pass);
  }
  @GetMapping("/isadmin/{id}")
  public  boolean isAdmin(@PathVariable int id){
    return userService.isAdmin(id);
  }
  @PostMapping("/login")
  public ResponseEntity<UserDto> login(@RequestBody CredentialsDto credentialsDto) {

    UserDto user = userService.login(credentialsDto);
    user.setToken(jwtService.generateToken(user.getUsername()));
    return ResponseEntity.ok(user);
  }

  @GetMapping("/hello")
  public String hello(){
    return "HELLO this is service user";
  }
  @PostMapping("/register")
  public ResponseEntity<UserDto> register(@RequestBody RegisterDto registerDto) {
    System.out.println(registerDto.getDateTime());
    UserDto user = userService.register(registerDto);
    user.setToken(jwtService.generateToken(user.getUsername()));

    return ResponseEntity.created(URI.create("/users" + user.getId()))
            .body(user);
  }
  @GetMapping("/all/{id}")
  public ResponseEntity<UpdateUserRequest> getPrivateInfor(@PathVariable int id){
    UpdateUserRequest userResponse = userService.getUserInfor(id);
    System.out.println(userResponse.getDateTime());
    return ResponseEntity.ok(userResponse);
  }
}
