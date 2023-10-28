package com.luanvan.inventoryService.controllers;

import com.luanvan.inventoryService.dto.InventoryDTO;
import com.luanvan.inventoryService.models.Inventory;
import com.luanvan.inventoryService.services.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class InventoryController {
  @Autowired
  private InventoryService inventoryService;

  @GetMapping("/test")
  public String hello() {
    return "This is inventory service";
  }

  @PostMapping
  public String add(@RequestBody InventoryDTO inventoryDTO) {

    inventoryService.add(inventoryDTO);
    return "them thanh cong";
  }

  @GetMapping
  public ArrayList<Inventory> getAll() {
    return (ArrayList<Inventory>) inventoryService.getAll();
  }

  @GetMapping("/{id}")
  public Inventory getById(@PathVariable String id) {

    return inventoryService.getById(id);
  }

  @DeleteMapping
  public String delete(@RequestParam String id) {
    inventoryService.delete(id);
    return "xoa thanh cong";
  }
}
