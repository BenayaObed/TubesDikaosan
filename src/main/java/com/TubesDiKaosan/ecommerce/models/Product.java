package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "Product")

public class Product {
  private int product_id;
  private String name_product;
  private int category;
  private int price;
  private int stock;

  public int getProduct_id() {
    return product_id;
  }

  public String getName_product() {
    return name_product;
  }

  public int getCategory() {
    return category;
  }

  public int getPrice() {
    return price;
  }

  public int getStock() {
    return stock;
  }

  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }

  public void setName_product(String name_product) {
    this.name_product = name_product;
  }

  public void setCategory(int category) {
    this.category = category;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }
}
