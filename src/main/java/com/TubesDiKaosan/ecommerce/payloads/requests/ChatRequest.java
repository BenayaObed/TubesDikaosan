package com.TubesDiKaosan.ecommerce.payloads.requests;


public class ChatRequest {
    private UserRequest sender;
    private UserRequest reciever;
    private String message;

    public ChatRequest() {}
    public ChatRequest(UserRequest sender, UserRequest reciever, String message) {
        this.sender = sender;
        this.reciever = reciever;
        this.message = message;
    }
    public UserRequest getSender() {
        return sender;
    }
    public void setSender(UserRequest sender) {
        this.sender = sender;
    }
    public UserRequest getReciever() {
        return reciever;
    }
    public void setReciever(UserRequest reciever) {
        this.reciever = reciever;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

}
