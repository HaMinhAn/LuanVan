package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PictureRepository extends JpaRepository<Picture,Integer> {

  Optional<Picture> findByCaption(String caption);

  List<Picture> findAllByBook(Book book);
}
