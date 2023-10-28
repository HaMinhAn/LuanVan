package com.luanvan.webservice.command.service;

import com.luanvan.webservice.command.dto.CategoryRequest;
import com.luanvan.webservice.command.exceptions.AppException;
import com.luanvan.webservice.command.model.Category;
import com.luanvan.webservice.command.repositories.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class CategoryService {
  @Autowired
  private CategoryRepository categoryRepository;

  public List<Category> getListCategory()
  {
    return categoryRepository.findAll();
  }

  public void addCategory(CategoryRequest categoryRequest){
    Category category = Category.builder().name(categoryRequest.getName()).build();
    categoryRepository.save(category);

  }
  public void updateCategory(CategoryRequest categoryRequest){
    Optional<Category> category = categoryRepository.findByName(categoryRequest.getName());
    if(category.isEmpty()){
      throw new AppException("Không tìm thấy loại", HttpStatus.NOT_FOUND);
    }
    Category category1 = category.get();
    category1.setName(categoryRequest.getName());

    categoryRepository.save(category1);
  }

  public void deleteCategory(Integer id){
    Optional<Category> categoryOptional = categoryRepository.findById(id);
    if(categoryOptional.isEmpty()){
      throw new AppException("Không tìm thấy loại", HttpStatus.NOT_FOUND);
    }
    categoryRepository.delete(categoryOptional.get());
  }
}
