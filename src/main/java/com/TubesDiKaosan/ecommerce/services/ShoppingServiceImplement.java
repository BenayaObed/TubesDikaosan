package com.TubesDiKaosan.ecommerce.services;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderItemRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class ShoppingServiceImplement implements CrudService<OrderItemRequest, String> {
    @Autowired(required = true)
    private DataSource dataSource;
    
    @Override
    public Response getAll() throws SQLException {
        return new Response(HttpStatus.METHOD_NOT_ALLOWED.value(), "Method not available", null);
    }

    // Tampilkan semua item yang ada di cart sesuai dengan session users
    @Override
    public Response getById(String user_id) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        String query = "SELECT orders_item.order_item_id,orders.order_id, product.product_name, product.price, orders_item.color, orders_item.size, orders_item.quantity, stock.image FROM orders_item INNER JOIN orders ON orders_item.order_id = orders.order_id INNER JOIN product ON orders_item.product_id = product.product_id INNER JOIN stock ON orders_item.stock_id = stock.stock_id WHERE orders.user_id = '" + user_id + "' AND orders.status = 'draft'";
        statement.executeQuery(query);

        ArrayList<OrdersItem> ordersItem = new ArrayList<OrdersItem>();
        while (statement.getResultSet().next()) {
            OrdersItem orderItem = new OrdersItem();
            Orders order = new Orders();

            orderItem.setOrder_item_id(statement.getResultSet().getInt("order_item_id"));
            order.setOrder_id(statement.getResultSet().getInt("order_id"));
            orderItem.setOrder_id(order);

            Product product = new Product();
            product.setName_product(statement.getResultSet().getString("product_name"));
            product.setPrice(statement.getResultSet().getInt("price"));

            Images image = new Images();
            String[] images = statement.getResultSet().getString("image").split(",");
            image.setImage(images[0]);
            ArrayList<Images> imagesList = new ArrayList<Images>();
            imagesList.add(image);
            product.setImages(imagesList);

            orderItem.setProduct_id(product);
            orderItem.setColor(statement.getResultSet().getString("color"));
            orderItem.setSize(statement.getResultSet().getString("size"));
            orderItem.setQuantity(statement.getResultSet().getInt("quantity"));
            ordersItem.add(orderItem);

        }
        connection.close();
        return new Response(HttpStatus.OK.value(), "Success", ordersItem);
    }

    // Delete item yang ada di cart sesuai dengan session users
    @Override
    public Response deleteById(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        String query = "DELETE FROM orders_item WHERE order_item_id = '" + id + "'";
        statement.executeUpdate(query);
        connection.close();
        return new Response(HttpStatus.OK.value(), "Success", null);
    }

    @Override
    public Response updateById(String id, OrderItemRequest request) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        String query = "UPDATE orders_item SET product_id = '" + request.getProduct_id() + "', color = '" + request.getColor() + "', size = '" + request.getSize() + "', quantity = '" + request.getQuantity() + "' WHERE order_item_id = '" + id + "'";
        statement.executeUpdate(query);

        ArrayList<OrdersItem> ordersItem = new ArrayList<OrdersItem>();
        while (statement.getResultSet().next()) {
            OrdersItem orderItem = new OrdersItem();
            Orders order = new Orders();

            orderItem.setOrder_item_id(statement.getResultSet().getInt("order_item_id"));
            order.setOrder_id(statement.getResultSet().getInt("order_id"));
            orderItem.setOrder_id(order);

            Product product = new Product();
            product.setName_product(statement.getResultSet().getString("product_name"));
            product.setPrice(statement.getResultSet().getInt("price"));

            Images image = new Images();
            String[] images = statement.getResultSet().getString("image").split(",");
            image.setImage(images[0]);
            ArrayList<Images> imagesList = new ArrayList<Images>();
            imagesList.add(image);
            product.setImages(imagesList);

            orderItem.setProduct_id(product);
            orderItem.setColor(statement.getResultSet().getString("color"));
            orderItem.setSize(statement.getResultSet().getString("size"));
            orderItem.setQuantity(statement.getResultSet().getInt("quantity"));
            ordersItem.add(orderItem);
        }
        connection.close();
        return new Response(HttpStatus.OK.value(), "Success", ordersItem);
    }

    // Add item ke cart sesuai dengan session users
    @Override
    public Response add(OrderItemRequest request) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ProductServiceImplement product = new ProductServiceImplement();

        Response productResponse = product.getById(request.getProduct_id());
        if (productResponse.getData() != null) {
            // Check stock from product service
            Boolean stock = product.checkStock(request.getProduct_id(), request.getColor(), request.getSize(), request.getQuantity());
            if (!stock) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "Stock is not enough", null);
            } else {
                // buat order baru dengan status draft
                String orderQuery = "INSERT INTO orders (user_id, status) VALUES ('" + request.getOrder_id().getUser_id() + "', 'draft')";
                statement.executeUpdate(orderQuery);

                // ambil order_id yang baru dibuat
                String order_idQuery = "SELECT order_id FROM orders WHERE user_id = '" + request.getOrder_id().getUser_id() + "' AND status = 'draft'";
                statement.executeQuery(order_idQuery);
                int order_id = 0;
                if (statement.getResultSet().next()) {
                    order_id = statement.getResultSet().getInt("order_id");
                }

                // buat order item baru
                String orderItemQuery = "INSERT INTO orders_item (order_id, product_id, color, size, quantity) VALUES ('" + order_id + "', '" + request.getProduct_id() + "', '" + request.getColor() + "', '" + request.getSize() + "', '" + request.getQuantity() + "')";
                statement.executeUpdate(orderItemQuery);

                return new Response(HttpStatus.OK.value(), "Success", null);
            }
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Product not found", null);
        }
    }
}
