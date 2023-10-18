package com.luanvan.webservice.command.configs;

import com.luanvan.webservice.command.dto.ErrorDto;
import com.luanvan.webservice.command.exceptions.AppException;
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
