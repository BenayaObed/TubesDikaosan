package com.TubesDiKaosan.ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.repositories.CategoryRepository;

@Service
public class CategoryServiceImplement implements CategoryService{
    @Autowired(required = true)
    private CategoryRepository categoryRepository;
    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }
    
}
