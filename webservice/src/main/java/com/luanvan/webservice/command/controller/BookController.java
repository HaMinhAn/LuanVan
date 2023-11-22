package com.luanvan.webservice.command.controller;

import com.luanvan.webservice.command.dto.BookResponse;
import com.luanvan.webservice.command.dto.CreateBookRequest;
import com.luanvan.webservice.command.dto.UpdateBookRequest;
import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/book")
public class BookController {
  @Autowired
  private  BookService bookService;
  @GetMapping("")
  public ResponseEntity<List<Book>> getAllBooks(){
    return ResponseEntity.ok(bookService.getAllBooks());
  }

  @GetMapping("/search")
  public ResponseEntity<List<Book>> searchBooks(@RequestParam String name){
    return ResponseEntity.ok(bookService.searchBooks(name));
  }

  @PostMapping
  public ResponseEntity<BookResponse> addBook(@RequestBody CreateBookRequest createBookRequest){
    BookResponse bookResponse = bookService.addBooks(createBookRequest);
    return ResponseEntity.created(URI.create("/api/book" + bookResponse.getId())).body(bookResponse);
  }

  @PutMapping("/{id}")
  public void updateBook(@PathVariable int id,@RequestBody UpdateBookRequest updateBookRequest){
    bookService.updateBook(id, updateBookRequest);
  }

  @GetMapping("/basket/{id}")
  public String getBookID(@PathVariable Integer id){
    System.out.println(id);
    return bookService.getBookID(id);
  }
  @GetMapping("/category/all/{id}")
  public ResponseEntity<ArrayList<Book>> getBookByCategory(@PathVariable int id){
    ArrayList<Book> books = bookService.getAllBookByCategory(id);
    return ResponseEntity.ok(books);
  }
  @GetMapping("/{id}")
  public ResponseEntity<Book> getBook(@PathVariable Integer id){
    Book book = bookService.getBook(id);
    return ResponseEntity.ok(book);
  }

  @PostMapping("/add/cart/{id}")
  public void addToCart(@PathVariable Integer id){
    bookService.addCart(id);
  }
  @DeleteMapping("/{id}")
  public String deleteBook(@PathVariable Integer id){
    return bookService.deleteBook(id);
  }
}
