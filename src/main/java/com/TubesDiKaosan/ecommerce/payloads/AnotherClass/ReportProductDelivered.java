package com.TubesDiKaosan.ecommerce.payloads.AnotherClass;

public class ReportProductDelivered {
    private String name_product;
    private String name_category;
    private Integer order_count;
    private Integer total_revenue;

    public ReportProductDelivered(String name_product, String name_category, Integer order_count, Integer total_revenue) {
        this.name_product = name_product;
        this.name_category = name_category;
        this.order_count = order_count;
        this.total_revenue = total_revenue;
    }

    public ReportProductDelivered() {
    }

    public String getName_product() {
        return this.name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public String getName_category() {
        return this.name_category;
    }

    public void setName_category(String name_category) {
        this.name_category = name_category;
    }

    public Integer getOrder_count() {
        return this.order_count;
    }

    public void setOrder_count(Integer order_count) {
        this.order_count = order_count;
    }

    public Integer getTotal_revenue() {
        return this.total_revenue;
    }

    public void setTotal_revenue(Integer total_revenue) {
        this.total_revenue = total_revenue;
    }
}
