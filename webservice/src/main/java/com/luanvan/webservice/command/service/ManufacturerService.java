package com.luanvan.webservice.command.service;

import com.luanvan.webservice.command.dto.ManufacturerRequest;
import com.luanvan.webservice.command.exceptions.AppException;
import com.luanvan.webservice.command.model.Manufacturer;
import com.luanvan.webservice.command.repositories.ManufacturerRepository;
import com.luanvan.webservice.command.repositories.ManufacturerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ManufacturerService {
  @Autowired
  private ManufacturerRepository manufacturerRepository;

  public List<Manufacturer> getListManufacturer()
  {
    return manufacturerRepository.findAll();
  }

  public void addManufacturer(ManufacturerRequest manufacturerRequest){
    Manufacturer manufacturer = Manufacturer.builder().name(manufacturerRequest.getName()).build();
    manufacturerRepository.save(manufacturer);

  }
  public void updateManufacturer(ManufacturerRequest manufacturerRequest){
    Optional<Manufacturer> manufacturer = manufacturerRepository.findByName(manufacturerRequest.getName());
    if(manufacturer.isEmpty()){
      throw new AppException("Không tìm thấy nhà xuất bản", HttpStatus.NOT_FOUND);
    }
    Manufacturer manufacturer1 = manufacturer.get();
    manufacturer1.setName(manufacturerRequest.getName());

    manufacturerRepository.save(manufacturer1);
  }

  public void deleteManufacturer(Integer id){
    Optional<Manufacturer> manufacturerOptional = manufacturerRepository.findById(id);
    if(manufacturerOptional.isEmpty()){
      throw new AppException("Không tìm thấy nhà xuất bản", HttpStatus.NOT_FOUND);
    }
    manufacturerRepository.delete(manufacturerOptional.get());
  }
}
