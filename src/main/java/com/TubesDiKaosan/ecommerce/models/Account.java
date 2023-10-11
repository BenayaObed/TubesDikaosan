package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "Account")
public class Account {
  // @Id
  private int account_id;
  private String name;
  private String username;
  private String password;
  private int role;

  public int getAccount_id() {
    return account_id;
  }

  public String getName() {
    return name;
  }

  public String getUsername() {
    return username;
  }

  public String getPassword() {
    return password;
  }

  public int getRole() {
    return role;
  }

  public void setAccount_id(int account_id) {
    this.account_id = account_id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public void setRole(int role) {
    this.role = role;
  }
}
