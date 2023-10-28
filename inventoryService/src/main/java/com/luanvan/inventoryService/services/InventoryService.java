package com.luanvan.inventoryService.services;

import com.luanvan.inventoryService.dto.InventoryDTO;
import com.luanvan.inventoryService.models.Inventory;
import com.luanvan.inventoryService.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Objects;
import java.util.Optional;

import static org.springframework.data.mongodb.core.FindAndModifyOptions.options;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

@Service
public class InventoryService {
  private final InventoryRepository repository;
  private MongoOperations mongoOperations;



  @Autowired
  public InventoryService(InventoryRepository repository, MongoOperations mongoOperations) {
    this.repository = repository;
    this.mongoOperations = mongoOperations;
  }
  public long generateSequence(String seqName) {

    Inventory counter = mongoOperations.findAndModify(query(where("_id").is(seqName)),
            new Update().inc("seq",1), options().returnNew(true).upsert(true),
            Inventory.class);
    return !Objects.isNull(counter) ? counter.getIdProduct() : 1;

  }
  public String add(InventoryDTO inventoryDTO)  {
    Inventory inventory = Inventory.builder().price(inventoryDTO.getPrice()).idProduct(inventoryDTO.getIdProduct()).quantity(inventoryDTO.getQuantity()).build();

      repository.save(inventory);
    return "them thanh cong";
  }
  public ArrayList<Inventory> getAll(){
    return (ArrayList<Inventory>) repository.findAll();
  }

  public Inventory getById(String id){
    return  repository.findById(id).get();
  }
  public String delete(String id){
    Optional<Inventory> inventory = repository.findById(id);
    repository.delete(inventory.get());
    return "xoa thanh cong";
  }
}
