package com.luanvan.webservice.command.controller;

import com.luanvan.webservice.command.dto.CategoryRequest;
import com.luanvan.webservice.command.model.Category;
import com.luanvan.webservice.command.service.CategoryService;
import com.luanvan.webservice.command.service.CategoryService;
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
@RequestMapping("api/book/category")
public class CategoryController {
  @Autowired
  private CategoryService categoryService;
  @GetMapping
  public ResponseEntity<List<Category>> categoryList(){
    return ResponseEntity.ok(categoryService.getListCategory());
  }

  @PostMapping
  public ResponseEntity createCategory(@RequestBody CategoryRequest categoryRequest){
    categoryService.addCategory(categoryRequest);
    return ResponseEntity.ok("Tạo phân loại thành công ");
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteCategory(@PathVariable Integer id){
    categoryService.deleteCategory(id);
    return  ResponseEntity.ok("Xóa phân loại thành công ");
  }

  @PutMapping
  public ResponseEntity updateCategory(@RequestBody CategoryRequest categoryRequest){
    categoryService.updateCategory(categoryRequest);
    return ResponseEntity.ok("Cập nhật phân loại thành công ");
  }
}
