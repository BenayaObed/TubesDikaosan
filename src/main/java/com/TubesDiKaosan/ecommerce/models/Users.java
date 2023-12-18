package com.TubesDiKaosan.ecommerce.models;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.UuidGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
@JsonIgnoreProperties(value = { "createdAt", "updatedAt" }, allowGetters = true)

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

  @ManyToOne
  @JoinColumn(name = "role_id")
  private Roles role;

  @CreationTimestamp
  @Column(name = "createdAt")
  @JsonIgnore private LocalDateTime createdAt;

  @UpdateTimestamp
  @Column(name = "updatedAt")
  @JsonIgnore  private LocalDateTime updatedAt;

  public Users() {
  }

  public Users(String user_id, String first_name, String last_name, String email, String password, Roles role,
      LocalDateTime createdAt, LocalDateTime updatedAt) {
    this.user_id = user_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.password = password;
    this.role = role;
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

  public Roles getRole() {
    return role;
  }

  public Integer getRole_id() {
    return role.getRole_id();
  }
  public void setRole(Roles role) {
    this.role = role;
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
