package com.luanvan.webservice.command.controller;

import com.luanvan.webservice.command.dto.LanguageRequest;
import com.luanvan.webservice.command.model.Language;
import com.luanvan.webservice.command.service.LanguageService;
import com.luanvan.webservice.command.service.LanguageService;
import com.sun.istack.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/book/language")
public class LanguageController {
  @Autowired
  private LanguageService languageService;
  @GetMapping
  public ResponseEntity<List<Language>> languageList(){
    return ResponseEntity.ok(languageService.getListLanguage());
  }

  @PostMapping
  public ResponseEntity createLanguage(@NotNull @RequestBody LanguageRequest languageRequest){
    languageService.addLanguage(languageRequest);
    return ResponseEntity.ok("Tạo ngôn ngữ thành công ");
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteLanguage(@PathVariable Integer id){
    languageService.deleteLanguage(id);
    return  ResponseEntity.ok("Xóa ngôn ngữ thành công ");
  }

  @PutMapping
  public ResponseEntity updateLanguage(@RequestBody LanguageRequest languageRequest){
    languageService.updateLanguage(languageRequest);
    return ResponseEntity.ok("Cập nhật ngôn ngữ thành công ");
  }
}
