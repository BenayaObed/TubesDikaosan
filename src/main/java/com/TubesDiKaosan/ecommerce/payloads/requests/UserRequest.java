package com.TubesDiKaosan.ecommerce.payloads.requests;

import java.util.List;

public class UserRequest {
  private String first_name;
  private String last_name;
  private String email;
  private String password;
  private RoleRequest role_id;
  private List<ChatRequest> chat;

  public UserRequest() {
  }

  public UserRequest(String first_name, String last_name, String email, String password, RoleRequest role_id, List<ChatRequest> chat) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.password = password;
    this.role_id = role_id;
    this.chat = chat;
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

  public RoleRequest getRole_id() {
    return role_id;
  }

  public void setRole_id(RoleRequest role_id) {
    this.role_id = role_id;
  }

  public List<ChatRequest> getChat() {
    return chat;
  }

  public void setChat(List<ChatRequest> chat) {
    this.chat = chat;
  }


}
