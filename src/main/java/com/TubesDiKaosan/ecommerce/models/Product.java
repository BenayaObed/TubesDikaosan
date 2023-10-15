package com.TubesDiKaosan.ecommerce.models;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Product")
public class Product {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int product_id;
  @Column(name = "name_product", length = 100)
  private String name_product;

  @ManyToOne
  @JoinColumn(name = "category_id", referencedColumnName = "category_id")
  private Category category;

  // TEXT
  @Column(columnDefinition = "TEXT")
  private String description;
  @Column(length = 255)
  @OneToMany(mappedBy = "product_image")
  private List<Images> images;

  private int price;

  // Stock
  @OneToMany(mappedBy = "product")
  private List<Stock> stock;

  @CreationTimestamp
  @Column(name = "createdAt")
  private LocalDateTime createdAt;

  @UpdateTimestamp
  @Column(name = "updatedAt")
  private LocalDateTime updatedAt;

  public Product() {
  }

  public Product(int product_id, String product_name, Category category, String description, List<Images> images,
      int price, List<Stock> stock, LocalDateTime createdAt, LocalDateTime updatedAt) {
    this.product_id = product_id;
    this.product_name = product_name;
    this.category = category;
    this.description = description;
    this.images = images;
    this.price = price;
    this.stock = stock;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  public Product() {

  }

  public int getProduct_id() {
    return product_id;
  }

  public String getProduct_name() {
    return product_name;
  }

  public Category getCategory() {
    return category;
  }

  public String getDescription() {
    return description;
  }

  public List<Images> getImages() {
    return images;
  }

  public int getPrice() {
    return price;
  }

  <<<<<<<

  Updated upstream

  public void setPrice(int price) {
    this.price = price;
  }

  public List<Stock> getStock() {
    return stock;
  }

  public void setStock(List<Stock> stock) {
    this.stock = stock;
  }

  =======

  public int getStock() {
    return stock;
  }

  >>>>>>>

  Stashed changes

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public LocalDateTime getUpdatedAt() {
    return updatedAt;
  }

  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }

  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }

  public void setCategory(Category category) {
    this.category = category;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public void setImages(List<Images> images) {
    this.images = images;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  public void setUpdatedAt(LocalDateTime updatedAt) {
    this.updatedAt = updatedAt;
  }

  <<<<<<<

  Updated upstream}=======
}>>>>>>>
Stashed
changes
