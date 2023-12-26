package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment,Integer>{
 
    @Query(value = "SELECT SUM(payment_total), DATE_FORMAT(created_at, '%M') FROM payments JOIN GROUP BY MONTH(created_at)", nativeQuery = true)
    List<Payment> getPaymentReportByMonth();

    @Query(value = "SELECT SUM(payment_total), DATE_FORMAT(created_at, '%M') FROM payments JOIN GROUP BY MONTH(created_at) WHERE YEAR(created_at) = ?1", nativeQuery = true)
    List<Payment> getPaymentReportByYear(Integer year);

    @Query(value = "SELECT SUM(payment_total), DATE_FORMAT(created_at, '%M') FROM payments JOIN GROUP BY MONTH(created_at) WHERE YEAR(created_at) = ?1 AND MONTH(created_at) = ?2", nativeQuery = true)
    Response getPaymentReportByYearAndMonth(Integer year, Integer month);
}

