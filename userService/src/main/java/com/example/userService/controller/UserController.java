package com.example.userService.controller;

import java.net.URI;
import java.util.List;

import com.example.userService.config.UserAuthProvider;
import com.example.userService.data.User;
import com.example.userService.model.CredentialsDto;
import com.example.userService.model.RegisterDto;
import com.example.userService.model.UserDto;
import com.example.userService.service.JwtService;
import com.example.userService.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/users")
public class UserController {
  @Autowired
  private UserService userService;
  @Autowired
  private JwtService jwtService;

  //  @GetMapping("/listUser")
//  public List<User> getAllUser() {
//    return userService.getAllUser();
//  }
  @GetMapping("{id}")
  public ResponseEntity<UserDto> getInfor(@PathVariable int id) {
    return ResponseEntity.ok(userService.getEmail(id));
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
    UserDto user = userService.register(registerDto);
    user.setToken(jwtService.generateToken(user.getUsername()));

    return ResponseEntity.created(URI.create("/users" + user.getId()))
            .body(user);
  }
}
