package com.TubesDiKaosan.ecommerce.services.ShoppingServices;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.PaymentMethod;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.CustomerAddressRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderItemRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CustomerAddressRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrderItemRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrdersRepository;
import com.TubesDiKaosan.ecommerce.repositories.PaymentRepository;
import com.TubesDiKaosan.ecommerce.repositories.ProductRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.PaymentServices.PaymentMethodService;

@Service
public class ShoppingServices {

    @Autowired
    private OrdersRepository OrdersRepository;

    @Autowired
    private ProductRepository ProductRepository;

    @Autowired
    private OrderItemRepository OrderItemRepository;

    @Autowired
    private PaymentRepository PaymentRepository;

    @Autowired
    private PaymentMethodService paymentMethodService;

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

    // GETORDER BY STATUS AND USERID
    public Response getOrderByStatusAndUserID(String status, String id) throws SQLException {
        if (OrdersRepository.getOrderCheckout(status, id) == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            Orders data = OrdersRepository.getOrderCheckout(status, id);
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
    public Response addOrderItem(OrderItemRequest orderItemRequest, Orders orderID) throws SQLException { // ADD ORDER
                                                                                                          // ITEM
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
        Integer price = ProductRepository.findById(orderItemRequest.getProduct_id()).get().getPrice();

        ordersItem.setQuantity(orderItemRequest.getQuantity());
        ordersItem.setTotal_price(price * orderItemRequest.getQuantity());
        OrderItemRepository.save(ordersItem);
        return new Response(HttpStatus.OK.value(), "success", ordersItem);
    }

    // DELETE ORDER ITEM
    public Response deleteOrderItem(Integer orderItemID) throws SQLException {
        OrderItemRepository.deleteById(orderItemID);
        return new Response(HttpStatus.OK.value(), "success", null);
    }

    @Autowired
    private CustomerAddressRepository addressRepository;
    @Autowired
    private UserRepository userRepository;

    public Response setBillingAddress(String id, CustomerAddressRequest request, Integer orderID) throws SQLException {
        Users user = (Users) userRepository.findById(id).get();
        if (user == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
        CustomerAddress addressData = new CustomerAddress();
        addressData.setAddress(request.getAddress());
        addressData.setCity(request.getCity());
        addressData.setProvince(request.getProvince());
        addressData.setPostal_code(request.getPostal_code());
        addressData.setPhone_number(request.getPhone_number());
        addressData.setCustomerAddress(user);
        addressRepository.save(addressData);

        Orders orders = (Orders) OrdersRepository.findById(orderID).get();
        orders.setAddress_id(addressData);
        orders.setStatus("checkout");
        orders.setNotes(request.getNotes());
        OrdersRepository.save(orders);
        return new Response(HttpStatus.OK.value(), "Success", addressData);
    }

    public Response updateAddress(String id, Integer addressId, CustomerAddressRequest request) throws SQLException {
        Users userData = (Users) userRepository.findById(id).get();
        if (userData == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
        Optional<CustomerAddress> optionalAddress = addressRepository.findById(addressId);
        if (optionalAddress.isPresent()) {
            CustomerAddress addressData = optionalAddress.get();
            addressData.setAddress(request.getAddress());
            addressData.setCity(request.getCity());
            addressData.setProvince(request.getProvince());
            addressData.setPostal_code(request.getPostal_code());
            addressData.setPhone_number(request.getPhone_number());
            addressData.setCustomerAddress(userData);

            addressRepository.save(addressData);
            return new Response(HttpStatus.OK.value(), "Success", addressData);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response cancelOrder(Integer order_id) {
        if (OrdersRepository.findById(order_id).isPresent()) {
            Orders orders = OrdersRepository.findById(order_id).get();
            orders.setStatus("draft");
            OrdersRepository.save(orders);
            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response setPayment(Integer order_id, String method, Integer bank, Float total) throws SQLException {
        if (OrdersRepository.findById(order_id).isPresent()) {

            Orders orders = OrdersRepository.findById(order_id).get();
            PaymentMethod paymentMethod = (PaymentMethod) paymentMethodService.findDataByID(bank).getData();
            System.out.println(paymentMethod.getPayment_method_name() + " " + paymentMethod.getId());
            Payment payment = new Payment();
            if (method.equals("COD")) {
                payment.setPayment_method(null);
                payment.setPayment_status("UNPAID");
                payment.setPayment_total(total);
                
                orders.setPayment_id(payment);
                orders.setStatus("pending");
            } else {
                payment.setPayment_method(paymentMethod);
                payment.setPayment_status("success");
                payment.setPayment_total(total);

            }
            PaymentRepository.save(payment);
            orders.setPayment_id(payment);
            orders.setStatus("pending");
            OrdersRepository.save(orders);
            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }
}
