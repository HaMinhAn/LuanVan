package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Language;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface LanguageRepository extends JpaRepository<Language,Integer> {
}
