package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Product;

public class RiviewRequest {
    private Integer product;
    private String user_id;
    private Float rate;
    private String comment;

    public RiviewRequest(){}
    public RiviewRequest(Integer product, String user_id, Float rate, String comment) {
        this.product = product;
        this.user_id = user_id;
        this.rate = rate;
        this.comment = comment;
    }
    
    public Integer getProduct() {
        return product;
    }
    public void setProduct(Integer product) {
        this.product = product;
    }
    public String getUser() {
        return user_id;
    }
    public void setUser(String user_id) {
        this.user_id = user_id;
    }
    public Float getRate() {
        return rate;
    }
    public void setRate(Float rate) {
        this.rate = rate;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
}
