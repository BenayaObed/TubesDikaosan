package com.TubesDiKaosan.ecommerce.payloads.AnotherClass;

public class ReportPaymentByDate {
    private Float total;
    private String month;
    private Integer year;

    public ReportPaymentByDate(Float total, String month, Integer year) {
        this.total = total;
        this.month = month;
        this.year = year;
    }

    public ReportPaymentByDate() {
        this.total = null;
        this.month = null;
        this.year = null;
    }

    public Float getTotal() {
        return this.total;
    }

    public String getMonth() {
        return this.month;
    }

    public Integer getYear() {
        return this.year;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public void setYear(Integer year) {
        this.year = year;
    }
}
