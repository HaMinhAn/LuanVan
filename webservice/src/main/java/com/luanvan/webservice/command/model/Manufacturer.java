package com.luanvan.webservice.command.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Manufacturer")
public class Manufacturer {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_Manufacturer", nullable = false)
  private Integer id;


  @Column(name = "name", columnDefinition = "nvarchar(40)")
  private String name;

  @Column(name = "id_phone")
  @OneToMany(mappedBy = "manufacturer", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JsonBackReference
  @ToString.Exclude
  private List<Book> books;

}
