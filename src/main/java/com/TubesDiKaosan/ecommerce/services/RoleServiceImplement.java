package com.TubesDiKaosan.ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.repositories.RoleRepository;

@Service
public class RoleServiceImplement implements RoleService{
    @Autowired(required = true)
    private RoleRepository roleRepository;
   
    @Override
    public List<Roles> getAll() {
        return roleRepository.findAll();
    }
    
}
