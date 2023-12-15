package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment,Integer>{
    
}
