package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.Product;

public class OrderItemRequest {
    private Orders order;
    private Product product_id;
    private Integer status_order;

    public OrderItemRequest() {}
    public OrderItemRequest(Orders order, Product product_id, Integer status_order) {
        this.order = order;
        this.product_id = product_id;
        this.status_order = status_order;
    }
    public Orders getorder() {
        return order;
    }
    public void setorder(Orders order) {
        this.order = order;
    }
    public Product getProduct_id() {
        return product_id;
    }
    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }
    public Integer getStatus_order() {
        return status_order;
    }
    public void setStatus_order(Integer status_order) {
        this.status_order = status_order;
    }
}
