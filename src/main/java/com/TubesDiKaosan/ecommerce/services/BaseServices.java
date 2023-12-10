package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public abstract class BaseServices<RequestType,IdType>{
    public abstract Response getAll()throws SQLException;
    public abstract Response findDataByID(IdType id) throws SQLException;
    public abstract Response deleteDataByID(IdType id) throws SQLException;
    public abstract Response updateDataById(IdType id, RequestType request) throws SQLException;
    public abstract Response createData(RequestType request) throws SQLException;
}
