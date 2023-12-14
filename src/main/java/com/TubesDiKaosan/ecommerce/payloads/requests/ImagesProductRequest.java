package com.TubesDiKaosan.ecommerce.payloads.requests;

public class ImagesProductRequest {
    private Integer image_id;
    private String image;
    public ImagesProductRequest() {
    }
    public ImagesProductRequest(Integer image_id, String image) {
        this.image_id = image_id;
        this.image = image;
    }
    public Integer getImage_id() {
        return image_id;
    }
    public void setImage_id(Integer image_id) {
        this.image_id = image_id;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    
}
