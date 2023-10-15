package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Product")

public class Product {
  private int product_id;
  private String name_product;
  
  @ManyToOne
  @JoinColumn(name = "category_id", referencedColumnName = "category_id")
  private Category category;
  private String description;
  private String image;
  private int price;
  private int stock;
  
  public Product() {}
  public Product(int product_id, String name_product, Category category, String description, String image, int price,
      int stock) {
    this.product_id = product_id;
    this.name_product = name_product;
    this.category = category;
    this.description = description;
    this.image = image;
    this.price = price;
    this.stock = stock;
  }
  public int getProduct_id() {
    return product_id;
  }
  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }
  public String getName_product() {
    return name_product;
  }
  public void setName_product(String name_product) {
    this.name_product = name_product;
  }
  public Category getCategory() {
    return category;
  }
  public void setCategory(Category category) {
    this.category = category;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  public String getImage() {
    return image;
  }
  public void setImage(String image) {
    this.image = image;
  }
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public int getStock() {
    return stock;
  }
  public void setStock(int stock) {
    this.stock = stock;
  }

}
