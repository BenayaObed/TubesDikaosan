package com.TubesDiKaosan.ecommerce.models;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer payment_id;

    @Column(name = "payment_method")
    private Integer payment_method;

    @Column(name = "payment_status")
    private Integer payment_status;

    @Column(name = "payment_total")
    private Integer payment_total;

    @CreationTimestamp
    @Column(name = "createdAt")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updatedAt")
    private LocalDateTime updatedAt;

    public Payment() {
    }
    
    public Payment(Integer payment_id, Integer payment_method, Integer payment_status, Integer payment_total,
            LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.payment_id = payment_id;
        this.payment_method = payment_method;
        this.payment_status = payment_status;
        this.payment_total = payment_total;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Integer getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(Integer payment_id) {
        this.payment_id = payment_id;
    }

    public Integer getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(Integer payment_method) {
        this.payment_method = payment_method;
    }

    public Integer getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(Integer payment_status) {
        this.payment_status = payment_status;
    }

    public Integer getPayment_total() {
        return payment_total;
    }

    public void setPayment_total(Integer payment_total) {
        this.payment_total = payment_total;
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
