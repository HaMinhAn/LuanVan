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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="Picture")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Picture {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_Picture")
  private Integer id;

  @Column(name = "Caption",columnDefinition = "nvarchar(100)")
  private String caption;

  @Column(name = "Image_Path",columnDefinition = "nvarchar(MAX)")
  private String path;

  @ManyToOne
  @JoinColumn(name = "id_book")
  @JsonBackReference
  private Book book;
}
