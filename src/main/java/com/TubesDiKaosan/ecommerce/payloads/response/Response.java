package com.TubesDiKaosan.ecommerce.payloads.response;

public class Response {
    private Integer status;
    private String message;
    private Object data;
    
    public Response(){}
    public Response(Integer status, String message, Object data){
        this.status = status; this.message = message; this.data = data;
    }

    // Get
    public Integer getStatus(){return this.status;}
    public String getMessage(){return this.message;}
    public Object getData(){return this.data;}

    //Set
    public void setStatus(Integer status){this.status = status;}
    public void setMessage(String message){this.message = message;}
    public void setData(Object data){this.data = data;}
}
