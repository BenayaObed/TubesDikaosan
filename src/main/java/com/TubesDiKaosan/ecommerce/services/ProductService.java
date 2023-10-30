package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;

import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

public interface ProductService {
    public Response getAll() throws SQLException;
    public Response getById(int id) throws SQLException;
    
    public Response getByCategory(CategoryRequest request) throws SQLException;
    public Response getBySearch(ProductRequest request) throws SQLException;

    public Response addProduct(ProductRequest request) throws SQLException;
    public Response updateById(int id, ProductRequest request) throws SQLException;
    public Response deleteById(Integer id) throws SQLException;
}
