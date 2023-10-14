package com.TubesDiKaosan.ecommerce.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public interface CategoryService{
    public Response getAll();
    public Response getById(int id);

    public Response addCategory(CategoryRequest request);
    public Response updateById(int id, CategoryRequest request);
    public Response deleteById(Integer id);
}
