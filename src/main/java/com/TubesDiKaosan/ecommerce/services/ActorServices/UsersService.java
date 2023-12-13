package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;

@Service
public abstract class UsersService extends BaseServices<UserRequest, String> {
    protected final UserRepository userRepository;
    protected final RolesService rolesService;
    
    @Autowired
    public UsersService(UserRepository userRepository, RolesService rolesService) {
        this.userRepository = userRepository;
        this.rolesService = rolesService;
    }

    @Override
    public final Response findDataByID(String id) throws SQLException {
        if (userRepository.findById(id).isPresent()) {
            Users data = userRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    public final Users findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public final Response login(String email, String password) throws SQLException {
        Users user = findByEmail(email);
        if (user != null) {
            if (password.equals(user.getPassword())) {
                return new Response(HttpStatus.OK.value(), "success", user);
            } else {
                return new Response(HttpStatus.BAD_REQUEST.value(), "Wrong password", null);
            }
        } else {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Email not found", null);
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
}