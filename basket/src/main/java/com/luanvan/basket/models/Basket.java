package com.luanvan.basket.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.io.Serializable;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@RedisHash("Basket")
public class Basket  implements Serializable {
  @Id
  private String username;
  private Set<BasketItem> items;
  private long totalPrice;
}
