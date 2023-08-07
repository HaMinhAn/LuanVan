package com.luanvan.BacketService.Entitys;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.List;
@Entity
public class Backet {
  @Id
  private int id;
  private List<Object> images;

  public Backet() {
  }

  public Backet(int galleryId) {
    this.id = galleryId;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public List<Object> getImages() {
    return images;
  }

  public void setImages(List<Object> images) {
    this.images = images;
  }
}
