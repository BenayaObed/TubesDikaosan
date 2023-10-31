package com.TubesDiKaosan.ecommerce.payloads.requests;

public class ImagesProductRequest {
    private ProductRequest product_image;
    private String image;

    public ImagesProductRequest(ProductRequest product_image, String image) {
        this.product_image = product_image;
        this.image = image;
    }

    public ProductRequest getProduct_image() {
        return product_image;
    }

    public void setProduct_image(ProductRequest product_image) {
        this.product_image = product_image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image= image;
    }
}
