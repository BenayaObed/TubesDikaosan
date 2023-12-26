package com.TubesDiKaosan.ecommerce.payloads.AnotherClass;

import com.TubesDiKaosan.ecommerce.models.Product;

import java.util.List;
import java.util.Map;

public class ShopPageData {
    private String title;
    private List<Product> products;
    private Map<Integer, Float> meanRatings;
    private List<String> categories;
    private List<Product> bestSellers;

    public ShopPageData(String title, List<Product> products, Map<Integer, Float> meanRatings, List<String> categories, List<Product> bestSellers) {
        this.title = title;
        this.products = products;
        this.meanRatings = meanRatings;
        this.categories = categories;
        this.bestSellers = bestSellers;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Map<Integer, Float> getMeanRatings() {
        return meanRatings;
    }

    public void setMeanRatings(Map<Integer, Float> meanRatings) {
        this.meanRatings = meanRatings;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public List<Product> getBestSellers() {
        return bestSellers;
    }

    public void setBestSellers(List<Product> bestSellers) {
        this.bestSellers = bestSellers;
    }

}
