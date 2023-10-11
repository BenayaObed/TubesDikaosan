package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "Payment")
public class Payment {
  private int id_payment;
  private int account_id;
  private Date date;
  private int total;
  private String status;
  private char metode_pembayaran;

  public int getId_payment() {
    return id_payment;
  }

  public int getAccount_id() {
    return account_id;
  }

  public Date getDate() {
    return date;
  }

  public int getTotal() {
    return total;
  }

  public String getStatus() {
    return status;
  }

  public char getMetode_pembayaran() {
    return metode_pembayaran;
  }

  public void setId_payment(int id_payment) {
    this.id_payment = id_payment;
  }

  public void setAccount_id(int account_id) {
    this.account_id = account_id;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public void setTotal(int total) {
    this.total = total;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public void setMetode_pembayaran(char metode_pembayaran) {
    this.metode_pembayaran = metode_pembayaran;
  }
}
