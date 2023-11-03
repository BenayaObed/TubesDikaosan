package com.TubesDiKaosan.ecommerce.payloads.requests;

public class StockProductRequest {
    private Integer product_id;
    private Integer stock;
    private String size;

    public StockProductRequest(Integer product_id, Integer stock, String size) {
        this.product_id = product_id;
        this.stock = stock;
        this.size = size;
    }

    public Integer getProduct_id() {
        return product_id;
    }
    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }
    public Integer getStock() {
        return stock;
    }
    public void setStock(Integer stock) {
        this.stock = stock;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }
    
}
