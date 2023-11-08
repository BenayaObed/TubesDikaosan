package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.Users;

public class OrderRequest {
    private String notes;
    private Users user_id;
    private Payment payment_id;

    public OrderRequest(){}
    public OrderRequest(String notes, Users user_id, Payment payment_id) {
        this.notes = notes;
        this.user_id = user_id;
        this.payment_id = payment_id;
    }
    public String getNotes() {
        return notes;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }
    public Users getUser_id() {
        return user_id;
    }
    public void setUser_id(Users user_id) {
        this.user_id = user_id;
    }
    public Payment getPayment_id() {
        return payment_id;
    }
    public void setPayment_id(Payment payment_id) {
        this.payment_id = payment_id;
    }

}
