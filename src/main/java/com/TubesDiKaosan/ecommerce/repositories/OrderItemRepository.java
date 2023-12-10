package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.OrdersItem;

@Repository
public interface OrderItemRepository extends JpaRepository<OrdersItem,Integer>{
    
}
