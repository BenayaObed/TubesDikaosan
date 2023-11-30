package com.TubesDiKaosan.ecommerce.services;

import java.util.List;

import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;

public class Functions {
    protected Product findProductById(List<Product> products, int productId) {
        for (Product product : products) {
            if (product.getProduct_id() == productId) {
                return product;
            }
        }
        return null;
    }

    protected Images findImageById(List<Images> images, int imageId) {
        for (Images image : images) {
            if (image.getImage_id() == imageId) {
                return image;
            }
        }
        return null;
    }

    protected Stock findStockById(List<Stock> stockList, int stockId) {
        for (Stock stock : stockList) {
            if (stock.getStock_id() == stockId) {
                return stock;
            }
        }
        return null;
    }
}
