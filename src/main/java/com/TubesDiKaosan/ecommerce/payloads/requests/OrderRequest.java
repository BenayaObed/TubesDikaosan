package com.TubesDiKaosan.ecommerce.payloads.requests;

import java.util.List;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.Users;

public class OrderRequest {
    private String notes;
    private Users user_id;
    private Payment payment_id;
    private List<OrderItemRequest> orderItemRequestList;

    public OrderRequest(){}

    public OrderRequest(String notes, Users user_id, Payment payment_id, List<OrderItemRequest> orderItemRequestList) {
        this.notes = notes;
        this.user_id = user_id;
        this.payment_id = payment_id;
        this.orderItemRequestList = orderItemRequestList;
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

    public List<OrderItemRequest> getOrderItemRequestList() {
        return orderItemRequestList;
    }

    public void setOrderItemRequestList(List<OrderItemRequest> orderItemRequestList) {
        this.orderItemRequestList = orderItemRequestList;
    }
    
}
