package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.TubesDiKaosan.ecommerce.models.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod,Integer> {

    @Query(value = "SELECT * FROM payment_method WHERE payment_method_name = ?1", nativeQuery = true)
    PaymentMethod findByName(String payment_method_name);
    
}
