package com.luanvan.webservice.command.repositories;


import com.luanvan.webservice.command.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category,Integer> {

  Optional<Category> findByName(String name);
}
