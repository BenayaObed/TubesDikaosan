package com.TubesDiKaosan.ecommerce.payloads.requests;

public class ProductRequest {
    private String name_product;
    private int category_id;
    private String description;
    private Integer price;
    private StockRequest stock;
    private ImagesProductRequest images;

    public ProductRequest(String name_product, int category_id, String description, Integer price, StockRequest stock, ImagesProductRequest images) {
        this.name_product = name_product;
        this.category_id = category_id;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.images = images;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product= name_product;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id= category_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description= description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price= price;
    }

    public StockRequest getStock() {
        return stock;
    }

    public void setStock(StockRequest stock) {
        this.stock= stock;
    }

    public ImagesProductRequest getImages() {
        return images;
    }

    public void setImages(ImagesProductRequest images) {
        this.images= images;
    }
}
