package com.TubesDiKaosan.ecommerce.services.ShoppingServices;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderItemRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.OrderItemRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrdersRepository;
import com.TubesDiKaosan.ecommerce.repositories.ProductRepository;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

@Service
public class ShoppingServices {

    @Autowired
    private OrdersRepository OrdersRepository;

    @Autowired
    private ProductRepository ProductRepository;

    @Autowired
    private OrderItemRepository OrderItemRepository;

    public Response getAllOrdersByUsers(String id) throws SQLException { // ORDERS CUSTOMER
        if (OrdersRepository.findAllByUser(id).isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<Orders> data = OrdersRepository.findAllByUser(id);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    // ORDERS
    public Response getDraftOrder(String id) throws SQLException { // GET DRAFT ORDER
        if (OrdersRepository.getDraftOrder(id) == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            Orders data = OrdersRepository.getDraftOrder(id);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
        
    }

    public Response getDataCart(Integer orderID, String UserID) throws SQLException { // GET ALL ITEM IN CART
        if (OrderItemRepository.getAllItemInCart(orderID).isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<OrdersItem> data = OrderItemRepository.getAllItemInCart(orderID);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    public Response createDraftOrder(Users userID) throws SQLException { // CREATE DRAFT ORDER
        Orders orders = new Orders();
        orders.setUser_id(userID);
        orders.setStatus("draft");
        OrdersRepository.save(orders);
        return new Response(HttpStatus.OK.value(), "success", orders);
    }
    // END ORDERS

    // CARTS
    public Response getAllOrdersItem(Integer orderID, String UserID) throws SQLException { // GET ALL ITEM IN CART
        if (OrderItemRepository.getAllItemInCart(orderID).isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<OrdersItem> data = OrderItemRepository.getAllItemInCart(orderID);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    // CARTS / ORDER_ITEM
    public Response addOrderItem(OrderItemRequest orderItemRequest, Orders orderID) throws SQLException { // ADD ORDER ITEM
        OrdersItem ordersItem = new OrdersItem();
        ordersItem.setOrder_id(orderID);
        ordersItem.setProduct_id((Product) ProductRepository.findById(orderItemRequest.getProduct_id()).get());
        ordersItem.setQuantity(orderItemRequest.getQuantity());
        ordersItem.setColor(orderItemRequest.getColor());
        ordersItem.setSize(orderItemRequest.getSize());

        Integer price = ProductRepository.findById(orderItemRequest.getProduct_id()).get().getPrice();
        ordersItem.setTotal_price(price * orderItemRequest.getQuantity());

        OrderItemRepository.save(ordersItem);
        return new Response(HttpStatus.OK.value(), "success", ordersItem);
    }

    // UPDATE ORDER ITEM
    public Response updateOrderItem(Integer orderItemID, OrderItemRequest orderItemRequest) throws SQLException {
        OrdersItem ordersItem = OrderItemRepository.findById(orderItemID).get();
        ordersItem.setQuantity(orderItemRequest.getQuantity());
        ordersItem.setColor(orderItemRequest.getColor());
        ordersItem.setSize(orderItemRequest.getSize());

        Integer price = ProductRepository.findById(orderItemRequest.getProduct_id()).get().getPrice();
        ordersItem.setTotal_price(price * orderItemRequest.getQuantity());

        OrderItemRepository.save(ordersItem);
        return new Response(HttpStatus.OK.value(), "success", ordersItem);
    }

    // DELETE ORDER ITEM
    public Response deleteOrderItem(Integer orderItemID) throws SQLException {
        OrderItemRepository.deleteById(orderItemID);
        return new Response(HttpStatus.OK.value(), "success", null);
    }
}
