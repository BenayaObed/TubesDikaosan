package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.OrdersItem;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrdersItem,Integer>{

    // GET ITEM IN CART AND STATUS ORDERS DRAFT
    @Query(value = "SELECT * FROM orders_item WHERE order_id = ?1", nativeQuery = true)
    List<OrdersItem> getAllItemInCart(Integer order_id);

    @Query(value = "SELECT SUM(price) FROM orders_item WHERE product_id = ?1 AND order_id = ?2", nativeQuery = true)
    Integer TotalPrice(Integer product_id, Integer order_id);

}
