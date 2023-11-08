package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;

public class CartRequest {
    private Product product_id;
    private Integer quantity;
    private Users user_id;

    public CartRequest() {}
    public CartRequest(Product product_id, Integer quantity, Users user_id) {
        this.product_id = product_id;
        this.quantity = quantity;
        this.user_id = user_id;
    }
    public Product getProduct_id() {
        return product_id;
    }
    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }
    public Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    public Users getUser_id() {
        return user_id;
    }
    public void setUser_id(Users user_id) {
        this.user_id = user_id;
    }
}
