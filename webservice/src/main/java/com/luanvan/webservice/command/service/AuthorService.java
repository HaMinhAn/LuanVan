package com.luanvan.webservice.command.service;


import com.luanvan.webservice.command.dto.AuthorRequest;
import com.luanvan.webservice.command.exceptions.AppException;
import com.luanvan.webservice.command.model.Author;
import com.luanvan.webservice.command.repositories.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
  @Autowired
  private AuthorRepository authorRepository;
  public List<Author> getListAuthor()
  {
    return authorRepository.findAll();
  }

  public void addAuthor(AuthorRequest authorRequest){
    Author author = Author.builder().name(authorRequest.getName()).DOB(authorRequest.getDOB()).story(authorRequest.getStory()).build();
    authorRepository.save(author);

  }
  public void updateAuthor(AuthorRequest authorRequest){
    Optional<Author> author = authorRepository.findById(authorRequest.getId());
    if(author.isEmpty()){
      throw new AppException("Không tìm thấy tác giả", HttpStatus.NOT_FOUND);
    }
    Author author1 = author.get();
    author1.setName(authorRequest.getName());
    author1.setDOB(authorRequest.getDOB());
    author1.setStory(authorRequest.getStory());

    authorRepository.save(author1);
  }

  public void deleteAuthor(Integer id){
    Optional<Author> authorOptional = authorRepository.findById(id);
    if(authorOptional.isEmpty()){
      throw new AppException("Khong tim thay", HttpStatus.NOT_FOUND);
    }
    authorRepository.delete(authorOptional.get());
  }

}
