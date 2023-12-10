package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock,Integer> {

    @Query(value = "SELECT * FROM stock WHERE product_id = ?1", nativeQuery = true)
    List<Stock> findStockByProductId(int product_id);
    
}
