package com.luanvan.webservice.command.repositories;


import com.luanvan.webservice.command.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Integer> {

}
