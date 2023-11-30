package com.TubesDiKaosan.ecommerce.payloads.requests;

import java.util.List;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ProductRequest {
    @NotNull @Size(min=5, max=30) private String name_product;
    @NotNull private Integer category_id;
    private String description;
    @NotNull private Integer price;
    @NotNull private Integer visible;
    @NotNull private List<StockProductRequest> stock;
    @NotNull private List<ImagesProductRequest> images;
    
    public ProductRequest() {
    }

    public ProductRequest(String name_product, Integer category_id, String description, Integer price, Integer visible,
            Integer categoryID, List<StockProductRequest> stock, List<ImagesProductRequest> images) {
        this.name_product = name_product;
        this.category_id = category_id;
        this.description = description;
        this.price = price;
        this.visible = visible;
        this.stock = stock;
        this.images = images;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public List<StockProductRequest> getStock() {
        return stock;
    }

    public void setStock(List<StockProductRequest> stock) {
        this.stock = stock;
    }

    public List<ImagesProductRequest> getImages() {
        return images;
    }

    public void setImages(List<ImagesProductRequest> images) {
        this.images = images;
    }

}
