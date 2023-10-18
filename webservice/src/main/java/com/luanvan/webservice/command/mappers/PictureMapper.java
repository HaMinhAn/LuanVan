package com.luanvan.webservice.command.mappers;

import com.luanvan.webservice.command.dto.CreatePicture;
import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.Picture;
import org.springframework.stereotype.Component;

@Component
public class PictureMapper {
  public Picture toPicture(CreatePicture picture, Book book){
    return Picture.builder()
            .caption(picture.getCaption())
            .book(book)
            .path(picture.getPath())
            .build();
  }
}
