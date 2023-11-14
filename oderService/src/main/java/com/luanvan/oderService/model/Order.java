package com.luanvan.oderService.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.luanvan.oderService.utils.OrderStatus;
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
import java.util.List;

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

  private String email;
  private String no;
  @Column(name = "username", columnDefinition = "nvarchar(max)")
  private String username;
  @Column(name = "receiver", columnDefinition = "nvarchar(max)")
  private String receiver;
  private LocalDateTime createdDate;
  @OneToMany(mappedBy = "oder")
  @JsonManagedReference
  private List<OrderItem> items;

  private String address;
  private long phoneNumber;
  private long totalPrice;

  private OrderStatus status;
  @ManyToOne
  @JoinColumn(name = "id_payment")
  private PaymentMethod paymentMethod;
  private boolean isPaid;
}
