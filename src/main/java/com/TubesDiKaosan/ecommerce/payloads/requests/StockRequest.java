package com.TubesDiKaosan.ecommerce.payloads.requests;

public class StockRequest {
    private String size;
    private String color;
    private Integer quantity;

    public StockRequest() {}
    public StockRequest(String size, String color, Integer quantity) {
        this.size = size;
        this.color = color;
        this.quantity = quantity;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
}
