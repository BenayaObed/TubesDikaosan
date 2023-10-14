package com.TubesDiKaosan.ecommerce.payloads.requests;

public class RoleRequest {
    private String role_name;

    public RoleRequest(){}
    public RoleRequest(String role_name){
        this.role_name = role_name;
    }
    
    public String getRole_name() {
        return this.role_name;
    }
    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }
}
