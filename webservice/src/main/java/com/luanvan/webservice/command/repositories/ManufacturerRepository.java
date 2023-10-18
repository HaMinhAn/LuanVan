package com.luanvan.webservice.command.repositories;

import com.luanvan.webservice.command.model.Manufacturer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ManufacturerRepository extends JpaRepository<Manufacturer, Integer>, PagingAndSortingRepository<Manufacturer, Integer> {

}
