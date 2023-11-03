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
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

// order item
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer order_id;

    // Relation Order Detail
    @ManyToOne
    @JoinColumn(name = "order_details_id")
    private Order_details details_order_id;

    // Relation Product
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product_id;

    @Column(name = "status_order")
    private Integer status_order;

    @CreationTimestamp
    @Column(name = "createdAt")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updatedAt")
    private LocalDateTime updatedAt;

    public Order() {
    }

    public Order(Integer order_id, Order_details details_order_id, Product product_id, Integer status_order,
            LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.order_id = order_id;
        this.details_order_id = details_order_id;
        this.product_id = product_id;
        this.status_order = status_order;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public Order_details getDetails_order_id() {
        return details_order_id;
    }

    public void setDetails_order_id(Order_details details_order_id) {
        this.details_order_id = details_order_id;
    }

    public Product getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }

    public Integer getStatus_order() {
        return status_order;
    }

    public void setStatus_order(Integer status_order) {
        this.status_order = status_order;
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
