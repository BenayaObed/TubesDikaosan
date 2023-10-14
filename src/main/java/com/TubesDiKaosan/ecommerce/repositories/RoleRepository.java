package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Roles;

@Repository
// <Book, String> artinya kita akan melakukan query terhadap model Book dengan tipe data primary key String
public interface RoleRepository extends JpaRepository<Roles, Integer>{

}
