package com.TubesDiKaosan.ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer>{

    @Query(value = "SELECT * FROM categories WHERE category_name LIKE %?1%", nativeQuery = true)
    List<Category> findCategoryByName(String keyword);
}
