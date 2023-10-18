package com.luanvan.webservice.command.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "author")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Author {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_author")
  private Integer id;
  @Column(name = "author_name", columnDefinition = "nvarchar(40)")
  private String name;
  private LocalDateTime DOB;
  @Column(name = "story", columnDefinition = "nvarchar(MAX)")
  private String story;

  @ManyToMany(mappedBy = "authors")
  @JsonBackReference
  private List<Book> books = new ArrayList<>();

}
