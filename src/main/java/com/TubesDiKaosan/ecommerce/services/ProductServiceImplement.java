package com.TubesDiKaosan.ecommerce.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
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
import java.sql.Timestamp;

@Service
public class ProductServiceImplement implements CrudService<ProductRequest,Integer> {
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

                product.setImages(new ArrayList<Images>());
                product.setStock(new ArrayList<Stock>());

                products.add(product);
            }

            int imageId = resultSet.getInt("image_id");
            if (imageId != 0 && findImageById(product.getImages(), imageId) == null) {
                Images image = new Images();
                image.setImage_id(imageId);
                image.setProduct(product);
                image.setImage(resultSet.getString("image"));
                product.getImages().add(image);
            }

            int stockId = resultSet.getInt("stock_id");
            if (stockId != 0 && findStockById(product.getStock(), stockId) == null) {
                Stock stock = new Stock();
                stock.setStock_id(stockId);
                stock.setProduct(product);
                stock.setSize(resultSet.getString("size"));
                stock.setQuantity(resultSet.getInt("quantity"));
                stock.setColor(resultSet.getString("color"));
                product.getStock().add(stock);
            }
            // created at and updated at
            Timestamp createdAt = resultSet.getTimestamp("created_at");
            if (createdAt != null) {
                product.setCreatedAt(createdAt.toLocalDateTime());
            }
            Timestamp updatedAt = resultSet.getTimestamp("updated_at");
            if (updatedAt != null) {
                product.setUpdatedAt(updatedAt.toLocalDateTime());
            }
        }
        connection.close();
        
        if (products.size() == 0)
            return new Response(HttpStatus.NOT_FOUND.value(), "data not found", null);
        else
            return new Response(HttpStatus.OK.value(), "success", products);
    }

    @Override
    public Response getById(int id) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM  product JOIN categories ON product.category_id = categories.category_id LEFT JOIN images ON product.product_id = images.product_id LEFT JOIN stock ON product.product_id = stock.product_id WHERE product.product_id = " + id);
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

                product.setImages(new ArrayList<Images>());
                product.setStock(new ArrayList<Stock>());

                products.add(product);
            }

            int imageId = resultSet.getInt("image_id");
            if (imageId != 0 && findImageById(product.getImages(), imageId) == null) {
                Images image = new Images();
                image.setImage_id(imageId);
                image.setProduct(product);
                image.setImage(resultSet.getString("image"));
                product.getImages().add(image);
            }

            int stockId = resultSet.getInt("stock_id");
            if (stockId != 0 && findStockById(product.getStock(), stockId) == null) {
                Stock stock = new Stock();
                stock.setStock_id(stockId);
                stock.setProduct(product);
                stock.setSize(resultSet.getString("size"));
                stock.setQuantity(resultSet.getInt("quantity"));
                stock.setColor(resultSet.getString("color"));
                product.getStock().add(stock);
            }
            Timestamp createdAt = resultSet.getTimestamp("created_at");
            if (createdAt != null) {
                product.setCreatedAt(createdAt.toLocalDateTime());
            }
            Timestamp updatedAt = resultSet.getTimestamp("updated_at");
            if (updatedAt != null) {
                product.setUpdatedAt(updatedAt.toLocalDateTime());
            }
        }
        connection.close();
        
        if (products.size() == 0)
            return new Response(HttpStatus.NOT_FOUND.value(), "data not found", null);
        else
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
        statement.executeUpdate("UPDATE product SET name_product = '" + request.getName_product() + "', category_id = "
                + request.getCategory_id() + ", description = '" + request.getDescription() + "', price = "
                + request.getPrice() + ", visible = " + request.getVisible() + " WHERE product_id = " + id);
        
        // query select for get ID images and stock
        ResultSet resultSet = statement.executeQuery("SELECT * FROM images WHERE product_id = " + id);
        ArrayList<Integer> imagesId = new ArrayList<>();
        while (resultSet.next()) {
            imagesId.add(resultSet.getInt("image_id"));
        }

        resultSet = statement.executeQuery("SELECT * FROM stock WHERE product_id = " + id);
        ArrayList<Integer> stockId = new ArrayList<>();
        while (resultSet.next()) {
            stockId.add(resultSet.getInt("stock_id"));
        }

        // query update stock and image by id
        for (ImagesProductRequest image : request.getImages()) {
            if (image.getImage_id() == 0) {
                statement.executeUpdate("INSERT INTO images (product_id, image) VALUES (" + id + ", '"
                        + image.getImage() + "')");
            } else {
                statement.executeUpdate("UPDATE images SET image = '" + image.getImage() + "' WHERE image_id = "
                        + image.getImage_id() + " AND product_id = " + id);
                imagesId.remove((Integer) image.getImage_id());
            }
        }

        for (StockProductRequest stock : request.getStock()) {
            if (stock.getStock_id() == 0) {
                statement.executeUpdate("INSERT INTO stock (product_id, size, quantity, color) VALUES (" + id + ", '"
                        + stock.getSize() + "', " + stock.getQuantity() + ", '" + stock.getColor() + "')");
            } else {
                statement.executeUpdate("UPDATE stock SET size = '" + stock.getSize() + "', quantity = "
                        + stock.getQuantity() + ", color = '" + stock.getColor() + "' WHERE stock_id = "
                        + stock.getStock_id() + " AND product_id = " + id);
                stockId.remove((Integer) stock.getStock_id());
            }
        }
        
        connection.close();
        if (getById(id).getData() == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "data not found", null);
        else
            return new Response(HttpStatus.OK.value(), "success", getById(id).getData());
    }

    @Override
    public Response add(ProductRequest request) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        // query include create_at and update_at
        statement.executeUpdate("INSERT INTO product (name_product, category_id, description, price, visible,created_at,updated_at) VALUES ('"
                + request.getName_product() + "', " + request.getCategory_id() + ", '" + request.getDescription()
                + "', " + request.getPrice() + ", " + request.getVisible() + ", NOW(), NOW())");

        ResultSet resultSet = statement.executeQuery("SELECT LAST_INSERT_ID() AS product_id");
        resultSet.next();
        int productId = resultSet.getInt("product_id");
        
        for (ImagesProductRequest image : request.getImages()) {
            statement.executeUpdate("INSERT INTO images (product_id, image,created_at, updated_at) VALUES (" + productId + ", '"
                    + image.getImage() + "', NOW(), NOW())");
        }

        for (StockProductRequest stock : request.getStock()) {
            statement.executeUpdate("INSERT INTO stock (product_id, size, quantity, color,created_at,updated_at) VALUES (" + productId
                    + ", '" + stock.getSize() + "', " + stock.getQuantity() + ", '" + stock.getColor() + "', NOW(), NOW())");
        }

        connection.close();
        return new Response(HttpStatus.OK.value(), "success", getById(productId).getData());
    }

    
}
