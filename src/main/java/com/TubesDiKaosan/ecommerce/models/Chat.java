package com.TubesDiKaosan.ecommerce.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import java.util.Date;
@Entity
@Table(name = "Chat")
public class Chat {
  private int id_chat;
  private Date date;
  private String content;
  private int id_sender;
  private int id_reciver;

  public int getId_chat() {
    return id_chat;
  }

  public Date getDate() {
    return date;
  }

  public String getContent() {
    return content;
  }

  public int getId_sender() {
    return id_sender;
  }

  public int getId_reciver() {
    return id_reciver;
  }

  public void setId_chat(int id_chat) {
    this.id_chat = id_chat;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public void setId_sender(int id_sender) {
    this.id_sender = id_sender;
  }

  public void setId_reciver(int id_reciver) {
    this.id_reciver = id_reciver;
  }
}
