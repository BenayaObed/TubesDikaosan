package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.TubesDiKaosan.ecommerce.models.Product;

// Custome Query untuk Product
public interface ProductRepository extends JpaRepository<Product, Integer>{
    
}
