package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.TubesDiKaosan.ecommerce.models.Roles;

import jakarta.annotation.PostConstruct;

@Repository
public interface RolesRepository extends JpaRepository<Roles,Integer>{
    @Query(value = "SELECT * FROM roles WHERE role_name = ?1", nativeQuery = true)
    Roles existsByName(String name);
}
