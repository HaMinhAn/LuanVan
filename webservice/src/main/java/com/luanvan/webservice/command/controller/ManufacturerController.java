package com.luanvan.webservice.command.controller;

import com.luanvan.webservice.command.dto.ManufacturerRequest;
import com.luanvan.webservice.command.model.Manufacturer;
import com.luanvan.webservice.command.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
@RestController
@RequestMapping("/api/book/manufacturer")
public class ManufacturerController {
  @Autowired
  private ManufacturerService manufacturerService;
  @GetMapping
  public ResponseEntity<List<Manufacturer>> manufacturerList(){
    return ResponseEntity.ok(manufacturerService.getListManufacturer());
  }

  @PostMapping
  public ResponseEntity createManufacturer(@RequestBody ManufacturerRequest manufacturerRequest){
    manufacturerService.addManufacturer(manufacturerRequest);
    return ResponseEntity.ok("Tạo nhà xuất bản thành công ");
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteManufacturer(@PathVariable Integer id){
    manufacturerService.deleteManufacturer(id);
    return  ResponseEntity.ok("Xóa nhà xuất bản thành công ");
  }

  @PutMapping("/manufacturer")
  public ResponseEntity updateManufacturer(@RequestBody ManufacturerRequest manufacturerRequest){
    manufacturerService.updateManufacturer(manufacturerRequest);
    return ResponseEntity.ok("Cập nhật nhà xuất bản thành công ");
  }
}
