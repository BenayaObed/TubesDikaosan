package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.TubesDiKaosan.ecommerce.models.CustomerAddress;

public interface CustomerAddressRepository extends JpaRepository<CustomerAddress,Integer>{
    
}
