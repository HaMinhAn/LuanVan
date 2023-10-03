package com.example.userService.service;


import com.example.userService.data.Role;
import com.example.userService.data.RoleRepository;
import com.example.userService.data.User;
import com.example.userService.data.UserRepository;
import com.example.userService.mappers.UserMapper;
import com.example.userService.model.AppException;
import com.example.userService.model.CredentialsDto;
import com.example.userService.model.RegisterDto;
import com.example.userService.model.UserDto;
import org.apache.http.client.methods.HttpHead;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.CharBuffer;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
  @Autowired
  private UserRepository userRepository;
  @Autowired
  private UserMapper userMapper;
  @Autowired
  private PasswordEncoder passwordEncoder;
  @Autowired
  private RoleRepository roleRepository;

  public UserDto findByUsername(String username) {
    User user = userRepository.findByUsername(username).orElseThrow(() -> new AppException("Unknown user", HttpStatus.NOT_FOUND));

    return userMapper.toUserDto(user);
  }

  public UserDto getEmail(int id) {
    Optional<User> userOptional = userRepository.findById(id);
    if (userOptional == null && userOptional.isEmpty()) {
      throw new AppException("User not exist", HttpStatus.BAD_REQUEST);
    }
    return userMapper.toUserDto(userOptional.get());

  }

  public UserDto login(CredentialsDto credentialsDto) {

    User user = userRepository.findByUsername(credentialsDto.getUsername()).orElseThrow(() -> new AppException("Unknown user", HttpStatus.NOT_FOUND));

    if (passwordEncoder.matches(CharBuffer.wrap(credentialsDto.getPassword()), user.getPassword())) {
      return userMapper.toUserDto(user);
    }
    throw new AppException("Invalid password", HttpStatus.BAD_REQUEST);
  }

  public UserDto register(RegisterDto registerDto) {
    Optional<User> userOptional = userRepository.findByUsername(registerDto.getUsername());
    if (userOptional.isPresent()) {
      throw new AppException("User is existed", HttpStatus.BAD_REQUEST);
    }
    Optional<Role> userRole = roleRepository.findById(2);
    User user = userMapper.registerToUser(registerDto);
    user.setPassword(passwordEncoder.encode(CharBuffer.wrap(registerDto.getPassword())));
    user.setRoles(Arrays.asList(userRole.get()));
    User userSave = userRepository.save(user);

    return userMapper.toUserDto(userSave);
  }

  public boolean isAdmin(int id) {
    Optional<User> userOptional = userRepository.findById(id);
    if(userOptional.isEmpty()){
      throw new AppException("Nguoi dung khong ton tai", HttpStatus.NOT_FOUND);
    }
    boolean isAdmin = userOptional.get().getRoles().stream().anyMatch(role -> role.getId() == 1);
    return isAdmin;
  }
}
