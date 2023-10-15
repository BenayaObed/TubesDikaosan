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

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer order_id;

    // Relation Cart
    @OneToOne
    @JoinColumn(name = "cart_id", referencedColumnName = "cart_id")
    private Cart cart_id;

    // Relation Product
    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
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

    public Order(Integer order_id, Cart cart_id, Product product_id, Integer status_order, LocalDateTime createdAt,
            LocalDateTime updatedAt) {
        this.order_id = order_id;
        this.cart_id = cart_id;
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

    public Cart getCart_id() {
        return cart_id;
    }

    public void setCart_id(Cart cart_id) {
        this.cart_id = cart_id;
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
