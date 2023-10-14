package com.TubesDiKaosan.ecommerce.payloads.requests;

public class CategoryRequest {
    private String category_name;
    private int visible;

    public CategoryRequest(String category_name, int visible) {
        this.category_name = category_name;
        this.visible = visible;
    }

    public String getCategory_name() {
        return category_name;
    }
    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
    public int getVisible() {
        return visible;
    }
    public void setVisible(int visible) {
        this.visible = visible;
    }
}
