package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "Order")
public class Order {
  private int id_order;
  private int id_product;
  private int id_payment;
  private int quantity;
  private String status_order;

  public int getId_order() {
    return id_order;
  }

  public int getId_product() {
    return id_product;
  }

  public int getId_payment() {
    return id_payment;
  }

  public int getQuantity() {
    return quantity;
  }

  public String getStatus_order() {
    return status_order;
  }

  public void setId_order(int id_order) {
    this.id_order = id_order;
  }

  public void setId_product(int id_product) {
    this.id_product = id_product;
  }

  public void setId_payment(int id_payment) {
    this.id_payment = id_payment;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public void setStatus_order(String status_order) {
    this.status_order = status_order;
  }
}
