package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.CustomerAddressRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CustomerAddressRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrderItemRepository;
import com.TubesDiKaosan.ecommerce.repositories.OrdersRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;
import com.TubesDiKaosan.ecommerce.services.ShoppingServices.ShoppingServices;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Service
@Primary
public class CustomerService extends UsersService {
    @Autowired
    private ShoppingServices shoppingServices;

    @Autowired
    private OrdersRepository OrdersRepository;

    public CustomerService(UserRepository userRepository, RolesService rolesService) {
        super(userRepository, rolesService);
    }
    
    @Override
    public Response getAll() throws SQLException {
        return new Response(HttpStatus.BAD_REQUEST.value(), "Method not allowed", null);
    }
    
    @Override
    public Response deleteDataByID(String id) throws SQLException {
        return new Response(HttpStatus.BAD_REQUEST.value(), "Method not allowed", null);
    }
    
    @Override
    public final Response updateDataById(String id, UserRequest request) throws SQLException {
        try {
            Optional<Users> optionalUser = super.userRepository.findById(id);

            if (optionalUser.isPresent()) {
                Users data = optionalUser.get();
                data.setFirst_name(request.getFirst_name());
                data.setLast_name(request.getLast_name());
                data.setEmail(request.getEmail());
                data.setPassword(request.getPassword());

                Response roleResponse = super.rolesService.findDataByID(request.getRole());
                if (roleResponse.getStatus() != HttpStatus.OK.value()) {
                    return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid role ID!", null);
                }

                Roles roleData = (Roles) roleResponse.getData();
                data.setRole(roleData);
                userRepository.save(data);

                return new Response(HttpStatus.OK.value(), "Success", data);
            } else {
                return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
            }
        } catch (Exception e) {
            return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Error updating user", null);
        }
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

        if (userRepository.findByEmail(request.getEmail()) != null) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Email already exists!", null);
        }

        Roles roleData = (Roles) roleResponse.getData();
        user.setRole(roleData);

        userRepository.save(user);
        return new Response(HttpStatus.OK.value(), "success", user);
    }

    public Response getRolesCustomer() throws SQLException {
        Roles role = rolesService.existsByName("CUSTOMER");
        if (role == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
        return new Response(HttpStatus.OK.value(), "success", role);
    }

    

    
}