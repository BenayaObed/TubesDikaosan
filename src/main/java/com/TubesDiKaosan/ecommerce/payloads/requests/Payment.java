package com.TubesDiKaosan.ecommerce.payloads.requests;

public class Payment {
    private Integer payment_id;
    private Integer payment_method;
    private Integer payment_status;
    private Integer payment_total;

    public Payment(){}

    public Payment(Integer payment_id, Integer payment_method, Integer payment_status, Integer payment_total) {
        this.payment_id = payment_id;
        this.payment_method = payment_method;
        this.payment_status = payment_status;
        this.payment_total = payment_total;
    }

    public Integer getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(Integer payment_id) {
        this.payment_id = payment_id;
    }

    public Integer getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(Integer payment_method) {
        this.payment_method = payment_method;
    }

    public Integer getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(Integer payment_status) {
        this.payment_status = payment_status;
    }

    public Integer getPayment_total() {
        return payment_total;
    }

    public void setPayment_total(Integer payment_total) {
        this.payment_total = payment_total;
    }
}
