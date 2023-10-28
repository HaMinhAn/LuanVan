package com.luanvan.webservice.command.service;

import com.luanvan.webservice.command.dto.LanguageRequest;
import com.luanvan.webservice.command.exceptions.AppException;
import com.luanvan.webservice.command.model.Language;
import com.luanvan.webservice.command.repositories.LanguageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class LanguageService {
  @Autowired
  private LanguageRepository languageRepository;

  public List<Language> getListLanguage()
  {
    return languageRepository.findAll();
  }

  public void addLanguage(LanguageRequest languageRequest){
    if(languageRequest.getName() == null ||languageRequest.getName() == ""){
      throw new AppException("Thiếu tên ngôn ngữ", HttpStatus.BAD_REQUEST);
    }
    Language language = Language.builder().language(languageRequest.getName()).build();
    languageRepository.save(language);

  }
  public void updateLanguage(LanguageRequest languageRequest){
    Optional<Language> language = languageRepository.findByLanguage(languageRequest.getName());
    if(language.isEmpty()){
      throw new AppException("Không tìm thấy ngôn ngữ", HttpStatus.NOT_FOUND);
    }
    Language language1 = language.get();
    language1.setLanguage(languageRequest.getName());

    languageRepository.save(language1);
  }

  public void deleteLanguage(Integer id){
    Optional<Language> languageOptional = languageRepository.findById(id);
    if(languageOptional.isEmpty()){
      throw new AppException("Không tìm thấy ngôn ngữ", HttpStatus.NOT_FOUND);
    }
    languageRepository.delete(languageOptional.get());
  }
}
