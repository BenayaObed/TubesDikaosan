package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public interface CrudService<RequestType,IdType> {
    public Response getAll()throws SQLException;
    public Response getById(int id) throws SQLException;
    public Response deleteById(IdType id) throws SQLException;
    public Response updateById(IdType id, RequestType request) throws SQLException;
    public Response add(RequestType request) throws SQLException;
}