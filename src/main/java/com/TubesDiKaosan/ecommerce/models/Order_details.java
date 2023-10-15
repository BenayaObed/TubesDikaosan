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
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "details_order_id")
    private Integer details_order_id;

    @Column(name = "notes", length = 128)
    private String notes;

    @OneToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private Order order_id;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private Users user_id;

    @OneToOne
    @JoinColumn(name = "payment_id", referencedColumnName = "payment_id")
    private Payment payment_id;
    
    @CreationTimestamp
    @Column(name = "createdAt")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updatedAt")
    private LocalDateTime updatedAt;

}
