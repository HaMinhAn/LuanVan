package com.example.userService.service;


import com.example.userService.data.Role;
import com.example.userService.data.RoleRepository;
import com.example.userService.data.User;
import com.example.userService.data.UserRepository;
import com.example.userService.mappers.UserMapper;
import com.example.userService.model.AppException;
import com.example.userService.model.CredentialsDto;
import com.example.userService.model.RegisterDto;
import com.example.userService.model.UpdateUserDto;
import com.example.userService.model.UpdateUserRequest;
import com.example.userService.model.UserDto;
import com.example.userService.model.UserResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.CharBuffer;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
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
    DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
    // Parse the string to LocalDateTime
    LocalDateTime localDateTime = LocalDateTime.parse(registerDto.getDateTime(), formatter);
    Optional<Role> userRole = roleRepository.findById(2);
    User user = userMapper.registerToUser(registerDto);
    user.setDOB(localDateTime);
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


  public void updateInfor(int id, UpdateUserDto updateUserDto) {
    Optional<User> optionalUser = userRepository.findById(id);
    if(optionalUser.isEmpty()){
      throw new AppException("Người dùng không hợp lệ", HttpStatus.BAD_REQUEST);
    }
    DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

    // Parse the string to LocalDateTime
    LocalDateTime localDateTime = LocalDateTime.parse(updateUserDto.getDateTime(), formatter);
    User user = optionalUser.get();
    if(!updateUserDto.getName().equals(user.getName())){
      user.setName(updateUserDto.getName());
    }
    if(!updateUserDto.getAddress().equals(user.getAddress())){
      user.setAddress(updateUserDto.getAddress());
    }
    if(updateUserDto.getAge() != (user.getAge())){
      user.setAge(updateUserDto.getAge());
    }
    if(updateUserDto.getPhoneNumber() != (user.getPhoneNumber())){
      user.setPhoneNumber(updateUserDto.getPhoneNumber());
    }
      user.setDOB(localDateTime);

    userRepository.save(user);
  }

  public void updateUserPass(int id, String pass) {
  Optional<User> optionalUser = userRepository.findById(id);
  if(optionalUser.isEmpty()){
    throw new AppException("Người dùng không hợp lệ", HttpStatus.BAD_REQUEST);
  }
    User user = optionalUser.get();
  String passEncode = passwordEncoder.encode(CharBuffer.wrap(pass));
  if(user.getPassword() == passEncode){
    throw  new AppException("Mật khẩu trùng với mật khẩu cũ", HttpStatus.BAD_REQUEST);
  }
  user.setPassword(passEncode);
  userRepository.save(user);
  }
  public void updateUser(int id, UpdateUserRequest updateUserRequest) {
    Optional<User> optionalUser = userRepository.findById(id);
    System.out.println(updateUserRequest);
    if(optionalUser.isEmpty()){
      throw new AppException("Khong the tim thong tin nguoi dung", HttpStatus.NOT_FOUND);
    }
    User user = optionalUser.get();
    if(!updateUserRequest.getName().equals(user.getName())){
      user.setName(updateUserRequest.getName());
    }
    if(!updateUserRequest.getAddress().equals(user.getAddress())){
      user.setAddress(updateUserRequest.getAddress());
    }
    if(updateUserRequest.getAge() != (user.getAge())){
      user.setAge(updateUserRequest.getAge());
    }
    if(updateUserRequest.getPhoneNumber() != (user.getPhoneNumber())){
      user.setPhoneNumber(updateUserRequest.getPhoneNumber());
    }
    userRepository.save(user);
    System.out.println("Cập nhật thông tin thành công");
  }
  public UpdateUserRequest getUserInfor(int id) {
    Optional<User> user = userRepository.findById(id);
    DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
    if(user.isEmpty()){
      throw new AppException("Khong the tim thong tin nguoi dung", HttpStatus.NOT_FOUND);
    }
    System.out.println(user.get().getDOB());
    UpdateUserRequest userResponse = UpdateUserRequest.builder()
            .name(user.get().getName())
            .age(user.get().getAge())
            .sex(user.get().getSex())
            .phoneNumber(user.get().getPhoneNumber())
            .dateTime(user.get().getDOB().toString())
            .address(user.get().getAddress())
            .build();
    return userResponse;
  }
}
