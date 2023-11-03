package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public interface CrudService<T> {
    public Response getAll()throws SQLException;
    public Response getById(int id) throws SQLException;
    public Response deleteById(Integer id) throws SQLException;
    public Response updateById(Integer id, T request) throws SQLException;
    public Response add(T request) throws SQLException;
}