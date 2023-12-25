package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import com.TubesDiKaosan.ecommerce.models.Riviews;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

@Repository
public interface RiviewRepository extends JpaRepository<Riviews, Integer> {
    
    @Query(value = "SELECT * FROM reviews WHERE product_id = ?1", nativeQuery = true)
    List<Riviews> riviewsByProduct(Integer product_id);
}
