package com.luanvan.oderService.model;

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
@Table(name = "item")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderItem {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_oderitem")
  private Integer id;
  @Column(name = "name", columnDefinition = "nvarchar(max)")
  private String name;

  private int quantity;

  private long price;

  private String url;
  @ManyToOne
  @JoinColumn(name = "id_oder")
  @JsonBackReference
  private Order oder;
}
