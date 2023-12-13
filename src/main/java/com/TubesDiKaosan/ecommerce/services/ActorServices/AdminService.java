package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;

@Service
@Primary
public class AdminService extends UsersService {


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
    public final Response updateDataById(String id, UserRequest request) throws SQLException {
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
