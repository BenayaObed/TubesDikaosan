package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;

public class RiviewRequest {
    private Integer review_id;
    private Product product;
    private Users user;
    private Integer rate;
    private String comment;

    public RiviewRequest(){}
    public RiviewRequest(Integer review_id, Product product, Users user, Integer rate, String comment) {
        this.review_id = review_id;
        this.product = product;
        this.user = user;
        this.rate = rate;
        this.comment = comment;
    }
    public Integer getReview_id() {
        return review_id;
    }
    public void setReview_id(Integer review_id) {
        this.review_id = review_id;
    }
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public Users getUser() {
        return user;
    }
    public void setUser(Users user) {
        this.user = user;
    }
    public Integer getRate() {
        return rate;
    }
    public void setRate(Integer rate) {
        this.rate = rate;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
}
