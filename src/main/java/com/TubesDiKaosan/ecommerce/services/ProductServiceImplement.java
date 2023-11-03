package com.TubesDiKaosan.ecommerce.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.payloads.requests.ImagesProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.StockProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public class ProductServiceImplement implements CrudService<ProductRequest> {
    @Autowired(required = true)
    private DataSource dataSource;

    private Product findProductById(List<Product> products, int productId) {
        for (Product product : products) {
            if (product.getProduct_id() == productId) {
                return product;
            }
        }
        return null;
    }

    private Images findImageById(List<Images> images, int imageId) {
        for (Images image : images) {
            if (image.getImage_id() == imageId) {
                return image;
            }
        }
        return null;
    }

    private Stock findStockById(List<Stock> stockList, int stockId) {
        for (Stock stock : stockList) {
            if (stock.getStock_id() == stockId) {
                return stock;
            }
        }
        return null;
    }

    @Override
    public Response getAll() throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(
                "SELECT * FROM  product JOIN categories ON product.category_id = categories.category_id LEFT JOIN images ON product.product_id = images.product_id LEFT JOIN stock ON product.product_id = stock.product_id");

        ArrayList<Product> products = new ArrayList<>();
        while (resultSet.next()) {
            int productId = resultSet.getInt("product_id");
            Product product = findProductById(products, productId);

            if (product == null) {
                product = new Product();
                product.setProduct_id(productId);
                product.setName_product(resultSet.getString("name_product"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setVisible(resultSet.getInt("visible"));

                Category category = new Category();
                category.setCategory_id(resultSet.getInt("category_id"));
                category.setCategory_name(resultSet.getString("category_name"));
                category.setVisible(resultSet.getInt("visible"));
                product.setCategory(category);

                product.setImages(new ArrayList<>());
                product.setStock(new ArrayList<>());

                products.add(product);
            }

            int imageId = resultSet.getInt("image_id");
            if (imageId != 0 && findImageById(product.getImages(), imageId) == null) {
                Images image = new Images();
                image.setImage_id(imageId);
                image.setProduct_image(product);
                product.getImages().add(image);
            }

            int stockId = resultSet.getInt("stock_id");
            if (stockId != 0 && findStockById(product.getStock(), stockId) == null) {
                Stock stock = new Stock();
                stock.setStock_id(stockId);
                stock.setProduct(product);
                stock.setSize(resultSet.getString("size"));
                stock.setQuantity(resultSet.getInt("quantity"));
                product.getStock().add(stock);
            }
        }
        connection.close();
        
        return new Response(HttpStatus.OK.value(), "success", products);
    }

    @Override
    public Response getById(int id) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE product_id = " + id);
        ArrayList<Product> products = new ArrayList<>();
        ArrayList<Images> images = new ArrayList<>();
        ArrayList<Stock> stock = new ArrayList<>();

        while (resultSet.next()) {
            Product product = new Product();
            product.setProduct_id(resultSet.getInt("product_id"));
            product.setName_product(resultSet.getString("name_product"));

            product.setDescription(resultSet.getString("description"));
            product.setPrice(resultSet.getInt("price"));

            Category category = new Category();
            category.setCategory_id(resultSet.getInt("category_id"));
            product.setCategory(category);

            Images image = new Images();
            image.setImage_id(resultSet.getInt("image_id"));
            images.add(image);
            product.setImages(images);

            Stock stok = new Stock();
            stok.setStock_id(resultSet.getInt("stock_id"));
            stock.add(stok);
            product.setStock(stock);

            products.add(product);
        }
        // close connection
        connection.close();
        return new Response(HttpStatus.OK.value(), "success", products);
    }

    @Override
    public Response deleteById(Integer id) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        statement.executeUpdate("DELETE FROM images WHERE product_id = " + id);
        statement.executeUpdate("DELETE FROM stock WHERE product_id = " + id);
        statement.executeUpdate("DELETE FROM product WHERE product_id = " + id);
        connection.close();
        return new Response(HttpStatus.OK.value(), "success", null);
    }

    @Override
    public Response updateById(Integer id, ProductRequest request) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        statement.executeUpdate("UPDATE products SET name_product = '" + request.getName_product() + "', category_id = "
                + request.getCategory_id() + ", description = '" + request.getDescription() + "', price = "
                + request.getPrice() + ", visible = " + request.getVisible() + " WHERE product_id = " + id);
        return new Response(HttpStatus.OK.value(), "success", getById(id));
    }

    @Override
    public Response add(ProductRequest request) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        statement.executeUpdate("INSERT INTO products (name_product, category_id, description, price, visible) VALUES ('"
                + request.getName_product() + "', " + request.getCategory_id() + ", '" + request.getDescription()
                + "', " + request.getPrice() + ", " + request.getVisible() + ")");

        ResultSet resultSet = statement.executeQuery("SELECT LAST_INSERT_ID() AS product_id");
        resultSet.next();
        int productId = resultSet.getInt("product_id");
        
        for (ImagesProductRequest image : request.getImages()) {
            statement.executeUpdate("INSERT INTO images (product_id, image) VALUES (" + productId + ", '"
                    + image.getImage() + "')");
        }

        for (StockProductRequest stock : request.getStock()) {
            statement.executeUpdate("INSERT INTO stock (product_id, size, quantity) VALUES (" + productId + ", '"
                    + stock.getSize() + "', " + stock.getStock() + ")");
        }

        connection.close();
        return new Response(HttpStatus.OK.value(), "success", getById(productId));
    }

    
}
