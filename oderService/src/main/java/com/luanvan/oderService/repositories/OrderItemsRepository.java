package com.luanvan.oderService.repositories;

import com.luanvan.oderService.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemsRepository extends JpaRepository<OrderItem, Integer> {
}
