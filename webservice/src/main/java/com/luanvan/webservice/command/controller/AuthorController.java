package com.luanvan.webservice.command.controller;

import com.luanvan.webservice.command.dto.AuthorRequest;
import com.luanvan.webservice.command.model.Author;
import com.luanvan.webservice.command.repositories.AuthorRepository;
import com.luanvan.webservice.command.service.AuthorService;
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
@RequestMapping("/api/book/author")
public class AuthorController {
  @Autowired
  private AuthorService authorService;
  @GetMapping
  public ResponseEntity<List<Author>> authorList(){
    return ResponseEntity.ok(authorService.getListAuthor());
  }

  @PostMapping
  public ResponseEntity createAuthor(@RequestBody AuthorRequest authorRequest){
    authorService.addAuthor(authorRequest);
    return ResponseEntity.ok("Tạo tác giả thành công ");
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteAuthor(@PathVariable Integer id){
    authorService.deleteAuthor(id);
    return  ResponseEntity.ok("Xóa tác giả thành công ");
  }

  @PutMapping
  public ResponseEntity updateAuthor(@RequestBody AuthorRequest authorRequest){
    authorService.updateAuthor(authorRequest);
    return ResponseEntity.ok("Cập nhật tác giả thành công ");
  }
}
