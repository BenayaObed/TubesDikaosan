package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Images;

@Repository
public interface ImagesRepository extends JpaRepository<Images,Integer>{

    @Query(value = "SELECT * FROM images WHERE product_id = ?1", nativeQuery = true)
    List<Images> findImagesByProductId(int product_id);
    
}
