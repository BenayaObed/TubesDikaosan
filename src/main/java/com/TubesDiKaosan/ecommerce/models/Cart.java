package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "Cart")
public class Cart {
  private int id_cart;
  private int productId;
  private int quantity;
  private Date date;

  public int getId_cart() {
    return id_cart;
  }

  public int getProductId() {
    return productId;
  }

  public int getQuantity() {
    return quantity;
  }

  public Date getDate() {
    return date;
  }

  public void setId_cart(int id_cart) {
    this.id_cart = id_cart;
  }

  public void setProductId(int productId) {
    this.productId = productId;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public void setDate(Date date) {
    this.date = date;
  }
}
