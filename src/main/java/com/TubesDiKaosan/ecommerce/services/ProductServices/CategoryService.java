package com.TubesDiKaosan.ecommerce.services.ProductServices;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CategoryRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;

@Service
public class CategoryService extends BaseServices<CategoryRequest, Integer>
{
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public Response getAll() throws SQLException {
        if (categoryRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        else{
            List<Category> data= categoryRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @Override
    public Response findDataByID(Integer id) throws SQLException {
        if (categoryRepository.findById(id).isPresent()) {
            Category data = categoryRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response deleteDataByID(Integer id) throws SQLException {
        if (categoryRepository.findById(id).isPresent()) {
            categoryRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response updateDataById(Integer id, CategoryRequest request) throws SQLException {
        if (categoryRepository.findById(id).isPresent()) {
            Category data = categoryRepository.findById(id).get();
            data.setCategory_name(request.getCategory_name());
            data.setVisible(request.getVisible());
            categoryRepository.save(data);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response createData(CategoryRequest request) throws SQLException {
        Category data = new Category();
        data.setCategory_name(request.getCategory_name());
        data.setVisible(request.getVisible());
        categoryRepository.save(data);
        return new Response(HttpStatus.OK.value(), "success", data);
    }

    public Response findCategoryByName(String keyword) {
        if (categoryRepository.findCategoryByName(keyword).isEmpty()) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        } else {
            List<Category> data = categoryRepository.findCategoryByName(keyword);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }
}
