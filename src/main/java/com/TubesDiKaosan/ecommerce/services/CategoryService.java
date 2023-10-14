package com.TubesDiKaosan.ecommerce.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;

@Service
public interface CategoryService{
    public List<Category> getAll();
}
