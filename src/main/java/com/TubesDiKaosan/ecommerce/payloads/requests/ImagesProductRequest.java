package com.TubesDiKaosan.ecommerce.payloads.requests;

public class ImagesProductRequest {
    private ProductRequest product_image;
    private String image_url;

    public ImagesProductRequest(ProductRequest product_image, String image_url) {
        this.product_image = product_image;
        this.image_url = image_url;
    }

    public ProductRequest getProduct_image() {
        return product_image;
    }

    public void setProduct_image(ProductRequest product_image) {
        this.product_image = product_image;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url= image_url;
    }
}
