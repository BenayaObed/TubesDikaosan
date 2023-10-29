package com.TubesDiKaosan.ecommerce.services;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CategoryRepository;

@Service
public class CategoryServiceImplement implements CategoryService {
    @Autowired(required = true)
    private CategoryRepository categoryRepository;

    @Override
    public Response getAll() {
        try {
            List<Category> data = categoryRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new Response(HttpStatus.BAD_REQUEST.value(), "failed", null);
        }
    }

    @Override
    public Response addCategory(CategoryRequest request) {
        try {
            Category category = new Category();
            category.setCategory_name(request.getCategory_name());
            category.setVisible(request.getVisible());
            categoryRepository.save(category);
            return new Response(HttpStatus.OK.value(), "success", category);
        } catch (Exception e) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "failed", null);
        }
    }

    @Override
    public Response updateById(int id, CategoryRequest request) {
        try {
            Category category = categoryRepository.findById(id).get();
            category.setCategory_name(request.getCategory_name());
            category.setVisible(request.getVisible());
            categoryRepository.save(category);
            return new Response(HttpStatus.OK.value(), "success", category);
        } catch (Exception e) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "failed", null);
        }
    }

    @Override
    public Response getById(int id) {
        try {
            Category category = categoryRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", category);
        } catch (Exception e) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "failed", null);
        }
    }

    @Override
    public Response deleteById(Integer id) {
        try {
            categoryRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } catch (Exception e) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "failed", null);
        }
    }
}
