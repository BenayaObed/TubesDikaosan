package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CustomerAddressRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrderItemRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrdersRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;


@Service
@Primary
public class AdminService extends UsersService {
    @Autowired
    private OrderItemRepository OrderItemRepository;
    @Autowired
    private OrdersRepository OrdersRepository;

    @Autowired
    private CustomerAddressRepository CustomerAddressRepository;

    public AdminService(UserRepository userRepository, RolesService rolesService) {
        super(userRepository, rolesService);
    }
    
    @Override
    public final Response getAll() throws SQLException {
        if (userRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<Users> data = userRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @Override
    public final Response deleteDataByID(String id) throws SQLException {
        if (userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response createData(UserRequest request) throws SQLException {
        Users user = new Users();
        user.setEmail(request.getEmail());
        user.setPassword(request.getPassword());
        user.setFirst_name(request.getFirst_name());
        user.setLast_name(request.getLast_name());

        Response roleResponse = rolesService.findDataByID(request.getRole());
        if (roleResponse.getStatus() != HttpStatus.OK.value()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid role ID!", null);
        }

        Roles roleData = (Roles) roleResponse.getData();
        user.setRole(roleData);

        userRepository.save(user);
        return new Response(HttpStatus.OK.value(), "success", user);
    }

    public final Response getAllRoles() throws SQLException {
        if (rolesService.getAll().getData() == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<Roles> data = (List<Roles>) rolesService.getAll().getData();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    // ORDERS & CARTS

    public Response getAllOrders() throws SQLException { // LIST ORDERS FOR ADMIN
        if (OrdersRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<Orders> data = OrdersRepository.findAll();
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

    public Response getOrderById(Integer id) throws SQLException { // GET ORDER BY ID
        if (OrdersRepository.findById(id).isPresent()) {
            Orders data = OrdersRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    public Response getOrderDetail(Integer id) throws SQLException { // GET ORDER DETAIL BY ID
        if (OrdersRepository.findById(id).isPresent()) {
            List<OrdersItem> data = OrderItemRepository.getOrderDetail(id);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    public Response getAddressCustomer(String UserID) throws SQLException { 
        if (CustomerAddressRepository.findByCustomerAddress(UserID) == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            
            CustomerAddress data = CustomerAddressRepository.findByCustomerAddress(UserID);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }
    
    public Response updateStatusOrder(Integer orderID, String status) {
        if (OrdersRepository.findById(orderID).isPresent()) {
            Orders data = OrdersRepository.findById(orderID).get();
            data.setStatus(status);
            OrdersRepository.save(data);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }
}
