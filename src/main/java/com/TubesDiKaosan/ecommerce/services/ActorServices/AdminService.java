package com.TubesDiKaosan.ecommerce.services.ActorServices;

import java.sql.SQLException;
import java.util.List;

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

}
