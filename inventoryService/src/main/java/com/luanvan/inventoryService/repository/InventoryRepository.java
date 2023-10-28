package com.luanvan.inventoryService.repository;

import com.luanvan.inventoryService.models.Inventory;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryRepository extends MongoRepository<Inventory, String> {

}
