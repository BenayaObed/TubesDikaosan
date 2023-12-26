package com.TubesDiKaosan.ecommerce.payloads.AnotherClass;

public class ReportOrderStatus {
    private String status;
    private Integer total;

    public ReportOrderStatus(String status, Integer total) {
        this.status = status;
        this.total = total;
    }

    public ReportOrderStatus() {
        this.status = null;
        this.total = null;
    }

    public String getStatus() {
        return this.status;
    }

    public Integer getTotal() {
        return this.total;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}
