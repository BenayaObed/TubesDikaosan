package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Orders;

@Repository
public interface OrdersRepository extends JpaRepository<Orders,Integer>{
    
}
