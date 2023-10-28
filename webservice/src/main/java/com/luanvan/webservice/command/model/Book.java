package com.luanvan.webservice.command.model;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "book")
public class Book {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_book")
  private Integer id;
  @Column(name = "name", columnDefinition = "nvarchar(max)")
  private String name;
  @Column(name = "no")
  private String no;
  @Column(name = "is_ready")
  private Boolean isReady = true;
  @Column(name = "description", columnDefinition = "nvarchar(max)")
  private String description;
  @Column(name = "price")
  private long price;
  @Column(name = "quantity")
  private int quantity;
  @OneToMany(mappedBy = "book")
  @JsonManagedReference
  private List<Picture> pictureList;

  @ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.MERGE)
  @JoinTable(name = "book_authors", joinColumns = @JoinColumn(name = "id_book"), inverseJoinColumns = @JoinColumn(name = "id_author"))
  @JsonManagedReference
  private List<Author> authors = new ArrayList<>();
  @ManyToOne
  @JoinColumn(name = "id_Category")
  @JsonManagedReference
  private Category category;

  @ManyToOne
  @JoinColumn(name = "id_language")
  @JsonManagedReference
  private Language language;
  @ManyToOne
  @JoinColumn(name = "id_manufacturer")
  @JsonManagedReference
  @ToString.Exclude
  private Manufacturer manufacturer;
}
