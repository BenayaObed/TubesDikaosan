package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Repository
public interface OrdersRepository extends JpaRepository<Orders,Integer>{
    @Query(value = "SELECT * FROM orders WHERE status != 'draft'", nativeQuery = true)
    List<Orders> findAll();

    //check if users have orders with status draft
    @Query(value = "SELECT * FROM orders WHERE user_id = ?1 AND status = 'draft'", nativeQuery = true)
    Orders getDraftOrder(String id);
    
    @Query(value = "SELECT * FROM orders WHERE user_id = ?1", nativeQuery = true)
    List<Orders> findAllByUser(String id);

    @Modifying
    @Transactional
    @Query(value = "UPDATE orders SET address_id = ?1 WHERE order_id = ?2", nativeQuery = true)
    void updateAddressID(Integer addressID, Integer orderID);

    @Query(value = "SELECT * FROM orders WHERE status = ?1 AND user_id = ?2", nativeQuery = true)
    Orders getOrderCheckout(String status, String id);

    // query to get order without draft status and checkout status by order id and user id
    @Query(value = "SELECT * FROM orders WHERE order_id = ?1 AND user_id = ?2 AND status != 'draft' AND status != 'checkout'", nativeQuery = true)
    Orders getOrderWithoutDraftAndCheckout(Integer orderID, String userID);

    @Query(value = "SELECT orders.status,COUNT(orders.status) FROM orders WHERE orders.status != 'checkout' AND orders.status != 'draft' GROUP BY orders.status;", nativeQuery = true)
    List<Object[]> getReportOrderStatus();
}
