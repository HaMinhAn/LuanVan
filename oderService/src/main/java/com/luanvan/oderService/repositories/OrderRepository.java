package com.luanvan.oderService.repositories;

import com.luanvan.oderService.model.Order;
import com.luanvan.oderService.utils.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

  Optional<Order> findByUsername(String user);


  Optional<Order> findByNo(String no);

  List<Order> findAllByStatus(OrderStatus status);
  List<Order> findAllByStatusAndIsPaid(OrderStatus status, boolean paid);

  Optional<List<Order>> findAllByUsername(String user);
}
