package com.luanvan.basket.repository;

import com.luanvan.basket.models.Basket;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BasketRepository extends CrudRepository<Basket, String> {
  long deleteByIdLikeIgnoreCase(Object unknownAttr1);

//  public static final String HASH_KEY = "Basket";
//  @Autowired
//  private RedisTemplate template;
//
//  public Basket save(Basket product){
//    template.opsForHash().put(HASH_KEY,product.getId(),product);
//    return product;
//  }
//
//  public ArrayList<Basket> findAll(){
//    return (ArrayList<Basket>) template.opsForHash().values(HASH_KEY);
//  }
//
//  public Basket findBasketById(int id){
//    return (Basket) template.opsForHash().get(HASH_KEY,id);
//  }
//
//  public Basket findBasketByName(String name){
//    return (Basket) template.opsForHash().get(HASH_KEY,name);
//  }
//
//  public String delete(int id){
//    template.opsForHash().delete(HASH_KEY,id);
//    return "Basket removed !!";
//  }
}
