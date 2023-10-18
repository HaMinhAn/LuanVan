package com.luanvan.webservice.command.mappers;

import com.luanvan.webservice.command.dto.BookResponse;
import com.luanvan.webservice.command.dto.CreateBookRequest;
import com.luanvan.webservice.command.model.Book;
import org.springframework.stereotype.Component;

@Component
public class BookMapper {

  public Book toBook(CreateBookRequest createBookRequest){
    Book book = Book.builder()
            .name(createBookRequest.getName())
            .price(createBookRequest.getPrice())
            .quantity(createBookRequest.getQuantity())
            .description(createBookRequest.getDescription())
            .build();
    return book;
  }

  public BookResponse toBookResponse(Integer book, String name){
    BookResponse phoneResponse = BookResponse.builder()
            .id(book)
            .name(name)
            .build();
    return phoneResponse;
  }
}
