package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.payloads.requests.OrderRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public class OrdersService implements CrudService<OrderRequest, Integer> {

    @Override
    public Response getAll() throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getAll'");
    }

    @Override
    public Response getById(Integer id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getById'");
    }

    @Override
    public Response deleteById(Integer id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
    }

    @Override
    public Response updateById(Integer id, OrderRequest request) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updateById'");
    }

    @Override
    public Response add(OrderRequest request) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'add'");
    }
    
}
