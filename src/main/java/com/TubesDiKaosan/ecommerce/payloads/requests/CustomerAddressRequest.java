package com.TubesDiKaosan.ecommerce.payloads.requests;

public class CustomerAddressRequest {
    private UserRequest userID;
    private String address;
    private String city;
    private String province;
    private String postal_code;
    private String phone_number;
    private String notes;

    public CustomerAddressRequest(){}

    public CustomerAddressRequest(UserRequest userID, String address, String city, String province, String postal_code,
            String phone_number, String notes) {
        this.userID = userID;
        this.address = address;
        this.city = city;
        this.province = province;
        this.postal_code = postal_code;
        this.phone_number = phone_number;
        this.notes = notes;
    }

    public UserRequest getUserID() {
        return userID;
    }

    public void setUserID(UserRequest userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
    
}
