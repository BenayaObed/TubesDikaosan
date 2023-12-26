package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.payloads.AnotherClass.ReportPaymentByDate;

import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {

    @Query(value = "SELECT CAST(SUM(payment_total) AS FLOAT) as total, MONTHNAME(created_at) as month FROM payments GROUP BY MONTH(created_at)", nativeQuery = true)
    List<Object[]> getPaymentReportByMonth();

    @Query(value = "SELECT CAST(SUM(payment_total) AS FLOAT) as total, MONTHNAME(created_at) as month, YEAR(created_at) as year FROM payments WHERE YEAR(created_at) = ?1 GROUP BY MONTH(created_at)", nativeQuery = true)
    List<Object[]> getPaymentReportByYear(Integer year);

    @Query(value = "SELECT CAST(SUM(payment_total) AS FLOAT) as total, MONTHNAME(created_at) as month FROM payments WHERE YEAR(created_at) = ?1 AND MONTH(created_at) = ?2 GROUP BY MONTH(created_at)", nativeQuery = true)
    List<Object[]> getPaymentReportByYearAndMonth(Integer year, Integer month);
}
