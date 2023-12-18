package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Orders;

@Repository
public interface OrdersRepository extends JpaRepository<Orders,Integer>{
    @Query(value = "SELECT * FROM orders WHERE status != 'draft'", nativeQuery = true)
    List<Orders> findAll();

    //check if users have orders with status draft
    @Query(value = "SELECT * FROM orders WHERE user_id = ?1 AND status = 'draft'", nativeQuery = true)
    Orders getDraftOrder(String id);
    
    @Query(value = "SELECT * FROM orders WHERE user_id = ?1", nativeQuery = true)
    List<Orders> findAllByCustomer(String id);
}
