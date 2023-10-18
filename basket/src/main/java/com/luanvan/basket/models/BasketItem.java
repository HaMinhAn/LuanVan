package com.luanvan.basket.models;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@RedisHash("BasketItem")
public class BasketItem  implements Serializable {
  @Id
  private int id;
  private String name;
  private long price;
  private int quantity;
  private String image;
}
