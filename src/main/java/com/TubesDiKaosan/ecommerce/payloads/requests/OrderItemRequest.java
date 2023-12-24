package com.TubesDiKaosan.ecommerce.payloads.requests;

import com.TubesDiKaosan.ecommerce.models.Orders;

public class OrderItemRequest {
    private Integer product_id;
    private String color;
    private String size;
    private Integer quantity;
    private Float total_price;

    public OrderItemRequest() {
    }

    public OrderItemRequest(Integer product_id, String color, String size, Integer quantity, Float total_price) {
        this.product_id = product_id;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Float total_price) {
        this.total_price = total_price;
    }
}
