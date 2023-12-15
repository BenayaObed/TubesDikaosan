package com.TubesDiKaosan.ecommerce.payloads.requests;

public class ImagesProductRequest {
    private Integer imageid_request;
    private String image;
    public ImagesProductRequest() {
        this.imageid_request = 0;
    }
    public ImagesProductRequest(Integer imageid_request, String image) {
        this.imageid_request = imageid_request;
        this.image = image;
    }
    public Integer getimageid_request() {
        return imageid_request;
    }
    public void setimageid_request(Integer imageid_request) {
        this.imageid_request = imageid_request;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    
}
