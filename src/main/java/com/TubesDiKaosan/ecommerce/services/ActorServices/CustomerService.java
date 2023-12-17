package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.CustomerAddressRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.CustomerAddressRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;

@Service
@Primary
public class CustomerService extends UsersService {
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

    // update data
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

    @Autowired
    private CustomerAddressRepository addressRepository;

    public Response addAddress(String id, CustomerAddressRequest request) throws SQLException {
        Response userResponse = super.findDataByID(id);
        if (userResponse.getStatus() != HttpStatus.OK.value()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid user ID!", null);
        }

        Users userData = (Users) userResponse.getData();

        CustomerAddress addressData = new CustomerAddress();
        addressData.setAddress(request.getAddress());
        addressData.setCity(request.getCity());
        addressData.setProvince(request.getProvince());
        addressData.setPostal_code(request.getPostal_code());
        addressData.setPhone_number(request.getPhone_number());
        addressData.setCustomerAddress(userData);

        addressRepository.save(addressData);
        return new Response(HttpStatus.OK.value(), "Success", addressData);
    }

    public Response updateAddress(String id, Integer addressId, CustomerAddressRequest request) throws SQLException {
        Response userResponse = super.findDataByID(id);
        if (userResponse.getStatus() != HttpStatus.OK.value()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid user ID!", null);
        }

        Users userData = (Users) userResponse.getData();

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

    public Response deleteAddress(String id, Integer addressId) throws SQLException {
        Response userResponse = super.findDataByID(id);
        if (userResponse.getStatus() != HttpStatus.OK.value()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid user ID!", null);
        }

        Optional<CustomerAddress> optionalAddress = addressRepository.findById(addressId);
        if (optionalAddress.isPresent()) {
            CustomerAddress addressData = optionalAddress.get();
            addressRepository.delete(addressData);
            return new Response(HttpStatus.OK.value(), "Success", null);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
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

        Roles roleData = (Roles) roleResponse.getData();
        user.setRole(roleData);

        userRepository.save(user);
        return new Response(HttpStatus.OK.value(), "success", user);
    }

    // query for get roles customer
    public Response getRolesCustomer() throws SQLException {
        Roles role = rolesService.existsByName("CUSTOMER");
        if (role == null) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        }
        return new Response(HttpStatus.OK.value(), "success", role);
    }
}