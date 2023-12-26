package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Product;

public class RiviewRequest {
    private Integer product;
    private String user;
    private Float rate;
    private String comment;

    public RiviewRequest(){}
    public RiviewRequest(Integer product, String user, Float rate, String comment) {
        this.product = product;
        this.user = user;
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
        return user;
    }
    public void setUser(String user) {
        this.user = user;
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
