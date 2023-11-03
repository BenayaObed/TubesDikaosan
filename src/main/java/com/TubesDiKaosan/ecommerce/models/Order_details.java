package com.TubesDiKaosan.ecommerce.models;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_details")
public class Order_details {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "details_order_id")
    private Integer details_order_id;

    @Column(name = "notes", length = 128)
    private String notes;

    @OneToOne
    @JoinColumn(name = "user_id")
    private Users user_id;

    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment payment_id;
    
    @CreationTimestamp
    @Column(name = "createdAt")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updatedAt")
    private LocalDateTime updatedAt;

    public Order_details(){}
    public Order_details(Integer details_order_id, String notes, Users user_id, Payment payment_id,
            LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.details_order_id = details_order_id;
        this.notes = notes;
        this.user_id = user_id;
        this.payment_id = payment_id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Integer getDetails_order_id() {
        return details_order_id;
    }

    public void setDetails_order_id(Integer details_order_id) {
        this.details_order_id = details_order_id;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Users getUser_id() {
        return user_id;
    }

    public void setUser_id(Users user_id) {
        this.user_id = user_id;
    }

    public Payment getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(Payment payment_id) {
        this.payment_id = payment_id;
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
