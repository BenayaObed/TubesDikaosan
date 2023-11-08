package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Order_details;
import com.TubesDiKaosan.ecommerce.models.Product;

public class OrderItemRequest {
    private Order_details details_order_id;
    private Product product_id;
    private Integer status_order;

    public OrderItemRequest() {}
    public OrderItemRequest(Order_details details_order_id, Product product_id, Integer status_order) {
        this.details_order_id = details_order_id;
        this.product_id = product_id;
        this.status_order = status_order;
    }
    public Order_details getDetails_order_id() {
        return details_order_id;
    }
    public void setDetails_order_id(Order_details details_order_id) {
        this.details_order_id = details_order_id;
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
