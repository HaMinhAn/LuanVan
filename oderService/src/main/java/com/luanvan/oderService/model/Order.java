package com.luanvan.oderService.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "oder")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Order {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id_oder")
  private Integer id;

  private String no;
  @Column(name = "name", columnDefinition = "nvarchar(max)")
  private String username;

  private LocalDateTime createdDate;
  @OneToMany(mappedBy = "oder")
  @JsonManagedReference
  private Set<OrderItem> items;

  private String address;
  private int phoneNumber;
  private long totalPrice;

  private String status;
  @ManyToOne
  @JoinColumn(name = "id_payment")
  @JsonBackReference
  private PaymentMethod paymentMethod;
  private boolean isPaid;
}
