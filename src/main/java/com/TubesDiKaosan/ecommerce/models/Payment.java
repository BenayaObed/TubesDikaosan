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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer payment_id;

    @ManyToOne(targetEntity = PaymentMethod.class)
    @JoinColumn(name = "payment_method_id") // Menambahkan @JoinColumn untuk menentukan kolom foreign key
    private PaymentMethod payment_method;

    @Column(name = "payment_status")
    private String payment_status; // PAID, UNPAID, CANCELLED

    @Column(name = "payment_total")
    private Float payment_total;

    @CreationTimestamp
    @Column(name = "createdAt")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updatedAt")
    private LocalDateTime updatedAt;

    public Payment() {
    }
    
    public Payment(Integer payment_id, PaymentMethod payment_method, String payment_status, Float payment_total,
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

    public PaymentMethod getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(PaymentMethod payment_method) {
        this.payment_method = payment_method;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public Float getPayment_total() {
        return payment_total;
    }

    public void setPayment_total(Float payment_total) {
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
