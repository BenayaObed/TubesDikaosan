package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.TubesDiKaosan.ecommerce.models.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    
}
