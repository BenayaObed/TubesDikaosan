package com.TubesDiKaosan.ecommerce.payloads.requests;

public class PaymentMethodRequest {
    private String payment_method_name;
    private String norek;
    private int isActive;

    public PaymentMethodRequest() {
    }

    public PaymentMethodRequest(String payment_method_name, String norek, int isActive) {
        this.payment_method_name = payment_method_name;
        this.norek = norek;
        this.isActive = isActive;
    }

    public String getPayment_method_name() {
        return this.payment_method_name;
    }

    public void setPayment_method_name(String payment_method_name) {
        this.payment_method_name = payment_method_name;
    }

    public String getNorek() {
        return this.norek;
    }

    public void setNorek(String norek) {
        this.norek = norek;
    }

    public int getIsActive() {
        return this.isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }
}
