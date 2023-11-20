package com.luanvan.webservice.command.service;

import com.luanvan.webservice.command.configs.BookSpecification;
import com.luanvan.webservice.command.dto.BookResponse;
import com.luanvan.webservice.command.dto.CreateBookRequest;
import com.luanvan.webservice.command.dto.CreatePicture;
import com.luanvan.webservice.command.dto.SendProductToCart;
import com.luanvan.webservice.command.exceptions.AppException;
import com.luanvan.webservice.command.mappers.BookMapper;
import com.luanvan.webservice.command.mappers.PictureMapper;
import com.luanvan.webservice.command.model.Author;
import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.Category;
import com.luanvan.webservice.command.model.Language;
import com.luanvan.webservice.command.model.Manufacturer;
import com.luanvan.webservice.command.model.Picture;
import com.luanvan.webservice.command.model.SearchCriteria;
import com.luanvan.webservice.command.repositories.AuthorRepository;
import com.luanvan.webservice.command.repositories.BookRepository;
import com.luanvan.webservice.command.repositories.CategoryRepository;
import com.luanvan.webservice.command.repositories.LanguageRepository;
import com.luanvan.webservice.command.repositories.ManufacturerRepository;
import com.luanvan.webservice.command.repositories.PictureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {

  @Autowired
  private BookMapper bookMapper;

  @Autowired
  private PictureMapper pictureMapper;
  @Autowired
  private BookRepository bookRepository;

  @Autowired
  private ManufacturerRepository manufacturerRepository;

  @Autowired
  private LanguageRepository languageRepository;

  @Autowired
  private CategoryRepository categoryRepository;

  @Autowired
  private PictureRepository pictureRepository;

  @Autowired
  private AuthorRepository authorRepository;
  @Autowired
  private WebClient webClient;

  @Autowired
  private KafkaTemplate<String, SendProductToCart> sendToCart;

  public List<Book> getAllBooks() {
//    System.out.println(token);
//    boolean isAdmin =    webClient.get().uri(String.format("http://localhost:9003/api/v1/users/isadmin/%d", id)).header("Authorization", String.format(token)).retrieve().bodyToMono(Boolean.class).block();
//    System.out.println(isAdmin+"..........................");
    return bookRepository.findAll();
  }

  public BookResponse addBooks(CreateBookRequest createBookRequest) {
    Optional<Book> phoneOptional = bookRepository.findByName(createBookRequest.getName());
    if (phoneOptional.isPresent()) {
      throw new AppException("Dien thoai da ton tai", HttpStatus.BAD_GATEWAY);
    }
    Book book = bookMapper.toBook(createBookRequest);
    Optional<Manufacturer> manufacturer = manufacturerRepository.findById(createBookRequest.getIdManufacturer());
    if (manufacturer.isEmpty()) {
      throw new AppException("Khong tim thay nha san xuat", HttpStatus.NOT_FOUND);
    }
    book.setManufacturer(manufacturer.get());
    Optional<Category> category = categoryRepository.findById(createBookRequest.getIdCategory());
    if (category.isEmpty()) {
      throw new AppException("Khong tim thay phan loai", HttpStatus.NOT_FOUND);
    }

    book.setCategory(category.get());
    Optional<Language> language = languageRepository.findById(createBookRequest.getIdLanguage());
    if (language.isEmpty()) {
      throw new AppException("Khong tim thay ngon ngu", HttpStatus.BAD_REQUEST);
    }

    book.setLanguage(language.get());

    Optional<Author> author = authorRepository.findById(createBookRequest.getIdAuthor());
    if (author.isEmpty()) {
      throw new AppException("Tac gia khong ton tai", HttpStatus.BAD_REQUEST);
    }
    ArrayList<Author> authors = new ArrayList<>();
    authors.add(author.get());
    book.setAuthors(authors);
    Book book1 = bookRepository.save(book);
    for (CreatePicture pic : createBookRequest.getList()
    ) {
      if (pictureRepository.findByCaption(pic.getCaption()).isEmpty()) {
        pictureRepository.save(pictureMapper.toPicture(pic, book1));
      }
    }
    return bookMapper.toBookResponse(book1.getId(), createBookRequest.getName());

  }

  public Book getBook(Integer id) {
    Optional<Book> book = bookRepository.findById(id);
    if (book.isEmpty()) {
      throw new AppException("Sach khong ton tai", HttpStatus.NOT_FOUND);
    }

    return book.get();
  }

  public String getBookID(Integer id) {
    Optional<Book> bookOptional = bookRepository.findById(id);
    if (bookOptional.isEmpty()) {
      throw new AppException("Khong co sach nay", HttpStatus.NOT_FOUND);
    }
    Book book = bookOptional.get();
    BookResponse bookResponse = BookResponse.builder().id(book.getId())
            .name(book.getName())
            .price(book.getPrice()).build();
    System.out.println(bookResponse.getName());
    return bookResponse.getName();
  }

  public ArrayList<Book> getAllBookByCategory(int id) {
    Optional<Category> category = categoryRepository.findById(id);
    ArrayList<Book> books = (ArrayList<Book>) bookRepository.findAllByCategory(category.get());
    if (books.isEmpty()) {
      return null;
    }
    return books;
  }

  public String deleteBook(Integer id) {
    Optional<Book> bookOptional = bookRepository.findById(id);
    if (bookOptional.isEmpty()) {
      throw new AppException("Sach khong ton tai", HttpStatus.NOT_FOUND);
    }
    Book book = bookOptional.get();
    List<Picture> pictures = pictureRepository.findAllByBook(book);
    if (pictures != null && !pictures.isEmpty()) {
      for (Picture pic : pictures) {
        pictureRepository.delete(pic);
      }
    }
    List<Author> authorArrayList =  book.getAuthors();
    if (authorArrayList != null && !authorArrayList.isEmpty()) {
      for (Author author : book.getAuthors()
      ) {
        author.getBooks().remove(book);
      }

    }
    book.setManufacturer(null);
    book.setLanguage(null);
    book.setCategory(null);

    bookRepository.save(book);
    Optional<Book> book1 = bookRepository.findById(id);
    bookRepository.delete(book1.get());
    return String.format("Xoa thanh cong sach %s", bookOptional.get().getName());
  }

  public void addCart(Integer id) {
    Optional<Book> bookOptional = bookRepository.findById(id);
    if(bookOptional.isEmpty()){
      throw new AppException("Không có sách này", HttpStatus.NOT_FOUND);
    }
    Book book = bookOptional.get();
    SendProductToCart sendProductToCart = SendProductToCart.builder()
            .id(id).name(book.getName()).price(book.getPrice())
            .build();
    sendToCart.send("cart-order",sendProductToCart);
  }

  public List<Book> searchBooks(String name) {
    System.out.println(String.format("%%%s%%",name));
    Specification<Book> spec = Specification.where(null);
    if (name != null) {
      spec = spec.and(BookSpecification.hasName(String.format("%%%s%%",name)));
    }
    List<Book> books = bookRepository.findAll(spec);
    return books;
  }
}
