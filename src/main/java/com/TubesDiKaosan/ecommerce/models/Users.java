package com.TubesDiKaosan.ecommerce.models;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.UuidGenerator;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class Users {
  @Id
  @GeneratedValue
  @UuidGenerator
  private String user_id;

  @Column(name = "first_name", length = 32)
  private String first_name;
  @Column(name = "last_name", length = 32)
  private String last_name;

  @Column(name = "email", length = 100)
  private String email;

  @Column(name = "password", length = 255)
  private String password;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "role_id")
  private Roles role_id;

  @CreationTimestamp
  @Column(name = "createdAt")
  private LocalDateTime createdAt;

  @UpdateTimestamp
  @Column(name = "updatedAt")
  private LocalDateTime updatedAt;

  public Users() {
  }
  
  public Users(String user_id, String first_name, String last_name, String email, String password, Roles role_id,
      LocalDateTime createdAt, LocalDateTime updatedAt) {
    this.user_id = user_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.password = password;
    this.role_id = role_id;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  public String getUser_id() {
    return user_id;
  }

  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }

  public String getFirst_name() {
    return first_name;
  }

  public void setFirst_name(String first_name) {
    this.first_name = first_name;
  }

  public String getLast_name() {
    return last_name;
  }

  public void setLast_name(String last_name) {
    this.last_name = last_name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Roles getRole_id() {
    return role_id;
  }

  public void setRole_id(Roles role_id) {
    this.role_id = role_id;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  public LocalDateTime getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(LocalDateTime updatedAt) {
    this.updatedAt = updatedAt;
  }

}
