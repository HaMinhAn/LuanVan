package com.luanvan.oderService.repositories;

import com.luanvan.oderService.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Integer> {

  Optional<Order> findByUsername(String user);


  Optional<Order> findByNo(String no);
}
