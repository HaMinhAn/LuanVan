package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Optional;

public interface BookRepository extends JpaRepository<Book, Integer>, JpaSpecificationExecutor<Book> {
  Optional<Book> findByName(String name);

  List<Book> findAllByCategory(Category category);

  List<Book> findAllByNameLike(String name);
}
