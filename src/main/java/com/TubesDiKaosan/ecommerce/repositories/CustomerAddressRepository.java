package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;

import java.util.List;
public interface CustomerAddressRepository extends JpaRepository<CustomerAddress,Integer>{
    
    // findAllByCustomerAddress
    @Query(value = "SELECT * FROM customer_address WHERE id_customer = ?1", nativeQuery = true)
    List<CustomerAddress> findAllByCustomerAddress(String id_customer);

    @Query(value = "SELECT * FROM customer_address WHERE id_customer = ?1", nativeQuery = true)
    CustomerAddress findByCustomerAddress(String id_customer);
}
