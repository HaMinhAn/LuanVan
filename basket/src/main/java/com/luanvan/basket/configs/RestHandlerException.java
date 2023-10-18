package com.luanvan.basket.configs;

import com.luanvan.basket.dto.AppException;
import com.luanvan.basket.dto.ErrorDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class RestHandlerException {

  @ExceptionHandler(value = {AppException.class})
  @ResponseBody
    public ResponseEntity<ErrorDto> handleException(AppException ex){
    return ResponseEntity.status(ex.getCode()).body(ErrorDto.builder().message(ex.getMessage()).build());
  }
}
