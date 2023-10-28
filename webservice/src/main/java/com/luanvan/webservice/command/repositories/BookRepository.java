package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BookRepository extends JpaRepository<Book, Integer> {
  Optional<Book> findByName(String name);

  List<Book> findAllByCategory(Category category);
}
