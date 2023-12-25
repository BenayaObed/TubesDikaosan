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

    @Autowired
    private PaymentRepository paymentRepository;

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

    public Response getPayment(Integer paymentID) throws SQLException {
        if (OrdersRepository.findById(paymentID).isPresent()) {
            Payment payment = OrdersRepository.findById(paymentID).get().getPayment_id();
            return new Response(HttpStatus.OK.value(), "Success", payment);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response setPayment(Integer order_id, String method, Integer bank, Float total) throws SQLException {
        if (OrdersRepository.findById(order_id).isPresent()) {
            Orders orders = OrdersRepository.findById(order_id).get();
            Payment payment = new Payment();
            System.out.println("Check method");
            System.out.println("METHOD:" + method + " BANK:" + bank + " TOTAL:" + total);
            if(method != "COD" && bank != null){
                System.out.println("Method Bank");
                PaymentMethod paymentMethod = (PaymentMethod) paymentMethodService.findDataByID(bank).getData();
                System.out.println("SET PAYMENT METHOD");
                payment.setPayment_method(paymentMethod);
                payment.setPayment_status("process-payment");
                payment.setPayment_total(total);

                orders.setPayment_id(payment);
                orders.setStatus("pending");
                PaymentRepository.save(payment);
            }else{
                System.out.println("Method COD");
                payment.setPayment_status("process-payment");
                payment.setPayment_total(total);

                orders.setPayment_id(payment);
                orders.setStatus("pending");
                PaymentRepository.save(payment);
            }

            OrdersRepository.save(orders);

            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    // update status payment
    public Response updateStatusPayment(Integer orderID, String status) throws SQLException {
        if (OrdersRepository.findById(orderID).isPresent()) {
            Orders orders = OrdersRepository.findById(orderID).get();
            Payment payment = orders.getPayment_id();
            payment.setPayment_status(status);
            PaymentRepository.save(payment);
            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response updateStatusOrder(Integer order_id, String string) {
        if (OrdersRepository.findById(order_id).isPresent()) {
            Orders orders = OrdersRepository.findById(order_id).get();
            orders.setStatus(string);
            OrdersRepository.save(orders);
            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response getOrderDetail(Integer id) throws SQLException { // GET ORDER DETAIL BY ID
        if (OrdersRepository.findById(id).isPresent()) {
            List<OrdersItem> data = OrderItemRepository.getOrderDetail(id);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    public Response getOrderWithoutDraftAndCheckout(Integer order_id, String user_id) {
        if (OrdersRepository.getOrderWithoutDraftAndCheckout(order_id, user_id) != null) {
            Orders orders = OrdersRepository.getOrderWithoutDraftAndCheckout(order_id, user_id);
            return new Response(HttpStatus.OK.value(), "Success", orders);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
    }

    public Response getItemDelivered(String user_id, Integer product_id) {
        if (OrderItemRepository.getItemDelivered(user_id, product_id).isEmpty()) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        } else {
            List<OrdersItem> ordersItems = OrderItemRepository.getItemDelivered(user_id, product_id);
            return new Response(HttpStatus.OK.value(), "Success", ordersItems);
        }
    }
    
}
