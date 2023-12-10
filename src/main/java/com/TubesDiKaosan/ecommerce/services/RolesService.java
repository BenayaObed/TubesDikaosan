package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.payloads.requests.RoleRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.RolesRepository;

@Service
public class RolesService extends BaseServices<RoleRequest,Integer>{

    @Autowired
    private RolesRepository rolesRepository;

    @Override
    public Response getAll() throws SQLException {
        if (rolesRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else{
            List<Roles> data = rolesRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @Override
    public Response findDataByID(Integer id) throws SQLException {
        if (rolesRepository.findById(id).isPresent()) {
            return new Response(HttpStatus.OK.value(), "success", rolesRepository.findById(id).get());
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response deleteDataByID(Integer id) throws SQLException {
        if (rolesRepository.findById(id).isPresent()) {
            rolesRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response updateDataById(Integer id, RoleRequest request) throws SQLException {
        if (rolesRepository.findById(id).isPresent()) {
            Roles data = rolesRepository.findById(id).get();
            data.setRole_name(request.getRole_name());
            rolesRepository.save(data);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }
    
    @Override
    public Response createData(RoleRequest request) throws SQLException {
        if (rolesRepository.existsByName(request.getRole_name()) != null) {
            return new Response(HttpStatus.CONFLICT.value(), "Data already exists!", null);
        } else {
            Roles data = new Roles();
            data.setRole_name(request.getRole_name());
            rolesRepository.save(data);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }
    
    // Method tambahan
    Roles existsByName(String name){
        return rolesRepository.existsByName(name);
    }
}
