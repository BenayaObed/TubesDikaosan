package com.TubesDiKaosan.ecommerce.services;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@Service
public class OrdersService implements CrudService<OrderRequest, Integer> {
    private DataSource dataSource;

    @Override
    public Response getAll() throws SQLException {
        Connection connection = dataSource.getConnection();
        String query = "SELECT orders.order_id, orders.notes, orders.status, orders.createdAt, orders.updatedAt, payment.total FROM orders INNER JOIN payment ON orders.payment_id = payment.payment_id WHERE orders.status != 'draft'";
        connection.createStatement().executeQuery(query);

        ArrayList<Orders> orders = new ArrayList<Orders>();
        while (connection.createStatement().getResultSet().next()) {
            Orders order = new Orders();
            Payment payment = new Payment();

            order.setOrder_id(connection.createStatement().getResultSet().getInt("order_id"));
            order.setNotes(connection.createStatement().getResultSet().getString("notes"));
            order.setStatus(connection.createStatement().getResultSet().getString("status"));
            order.setCreatedAt(connection.createStatement().getResultSet().getTimestamp("createdAt").toLocalDateTime());
            order.setUpdatedAt(connection.createStatement().getResultSet().getTimestamp("updatedAt").toLocalDateTime());
            payment.setPayment_total(connection.createStatement().getResultSet().getInt("total"));
            payment.setPayment_id(connection.createStatement().getResultSet().getInt("payment_id"));
            order.setPayment_id(payment);

            Users user = new Users();
            user.setUser_id(connection.createStatement().getResultSet().getString("user_id"));
            order.setUser_id(user);

            orders.add(order);
        }

        return new Response(HttpStatus.OK.value(), "Success get all orders", orders);
    }

    @Override
    public Response getById(Integer id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getById'");
    }

    @Override
    public Response deleteById(Integer id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
    }

    @Override
    public Response updateById(Integer id, OrderRequest request) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updateById'");
    }

    @Override
    public Response add(OrderRequest request) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'add'");
    }
    
}
