package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.Optional;

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
    public Response updateDataById(String id, UserRequest request) throws SQLException {
        try {
            Optional<Users> optionalUser = userRepository.findById(id);

            if (optionalUser.isPresent()) {
                Users data = optionalUser.get();
                data.setFirst_name(request.getFirst_name());
                data.setLast_name(request.getLast_name());
                data.setEmail(request.getEmail());
                data.setPassword(request.getPassword());

                // Fetch role information
                Response roleResponse = rolesService.findDataByID(request.getRole());
                if (roleResponse.getStatus() != HttpStatus.OK.value()) {
                    return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid role ID!", null);
                }

                Roles roleData = (Roles) roleResponse.getData();

                // Update user's roles
                data.setRole(roleData);

                // Save the updated user
                userRepository.save(data);

                return new Response(HttpStatus.OK.value(), "Success", data);
            } else {
                return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
            }
        } catch (Exception e) {
            // Handle specific exceptions and log the error
            return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Error updating user", null);
        }
    }
}