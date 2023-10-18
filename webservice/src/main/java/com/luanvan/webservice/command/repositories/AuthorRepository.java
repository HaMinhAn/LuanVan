package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Integer> {
}
