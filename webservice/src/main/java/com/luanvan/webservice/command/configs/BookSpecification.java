package com.luanvan.webservice.command.configs;

import com.luanvan.webservice.command.model.Book;
import com.luanvan.webservice.command.model.SearchCriteria;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class BookSpecification  {
  public static Specification<Book> hasName(String name) {
    return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("name"), name);
  }
}
