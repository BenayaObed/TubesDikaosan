package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.TubesDiKaosan.ecommerce.models.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock,Integer> {

    @Query(value = "SELECT * FROM stock WHERE product_id = ?1", nativeQuery = true)
    List<Stock> findStockByProductId(int product_id);

    @Query(value = "SELECT * FROM stock WHERE product_id = ?1 AND size = ?2 AND color = ?3", nativeQuery = true)
    Stock findStockByProductIdAndSizeAndColor(int product_id, String size, String color);

    @Query(value = "SELECT * FROM stock WHERE product_id = ?1 AND color = ?2", nativeQuery = true)
    List<Stock> findStockByProductIdAndColor(int product_id, String color);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM stock WHERE product_id = ?1 AND color = ?2", nativeQuery = true)
    void deleteStockByColor(int product_id, String color);
}
