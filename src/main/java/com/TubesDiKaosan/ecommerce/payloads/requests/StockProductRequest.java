package com.TubesDiKaosan.ecommerce.payloads.requests;

public class StockProductRequest {
    private Integer stock_id;
    private Integer product_id;
    private String size;
    private Integer quantity;
    private String color;

    public StockProductRequest() {
    }

    public StockProductRequest(Integer stock_id, Integer product_id, String size, Integer quantity, String color) {
        this.stock_id = stock_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
        this.color = color;
    }

    public Integer getStock_id() {
        return stock_id;
    }

    public void setStock_id(Integer stock_id) {
        this.stock_id = stock_id;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
