package com.TubesDiKaosan.ecommerce.services;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.management.relation.Role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;

@Service
public class UsersService extends BaseServices<UserRequest, String> implements UserDetailsService{

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RolesService rolesService;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public Response getAll() throws SQLException {
        if (userRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<Users> data = userRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @Override
    public Response findDataByID(String id) throws SQLException {
        if (userRepository.findById(id).isPresent()) {
            Users data = userRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response deleteDataByID(String id) throws SQLException {
        if (userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
public Response updateDataById(String id, UserRequest request) {
    try {
        Optional<Users> optionalUser = userRepository.findById(id);

        if (optionalUser.isPresent()) {
            Users data = optionalUser.get();
            data.setFirst_name(request.getFirst_name());
            data.setLast_name(request.getLast_name());
            data.setEmail(request.getEmail());

            // Fetch role information
            Response roleResponse = rolesService.findDataByID(request.getRole());
            if (roleResponse.getStatus() != HttpStatus.OK.value()) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid role ID!", null);
            }

            Roles roleData = (Roles) roleResponse.getData();

            // Set the new role for the user
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

    @Override
public Response createData(UserRequest request) {
    try {
        // Check if the user with the given email already exists
        Users existingUser = findByEmail(request.getEmail());
        if (existingUser != null) {
            return new Response(HttpStatus.CONFLICT.value(), "Data already exists!", null);
        }

        // Fetch role information
        Response roleResponse = rolesService.findDataByID(request.getRole());
        if (roleResponse.getStatus() != HttpStatus.OK.value()) {
            return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid role ID!", null);
        }

        Roles roleData = (Roles) roleResponse.getData();

        // Create a new user
        Users newUser = new Users();
        newUser.setFirst_name(request.getFirst_name());
        newUser.setLast_name(request.getLast_name());
        newUser.setEmail(request.getEmail());
        newUser.setPassword(passwordEncoder.encode(request.getPassword()));
        newUser.setRole(roleData);

        // Save the new user
        userRepository.save(newUser);

        return new Response(HttpStatus.OK.value(), "Success", newUser);
    } catch (Exception e) {
        // Handle specific exceptions and log the error
        return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Error creating user", null);
    }
}


    Users findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Roles> roles){
    //     return roles.stream ().map ( role -> new SimpleGrantedAuthority ( role.getRole_name()) ).collect ( Collectors.toList (  ) );
    // }

    @Override
public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    Users user = this.findByEmail(email);
    if (user == null) {
        throw new UsernameNotFoundException("Invalid username or password.");
    }
    String roleName = user.getRole().getRole_name();
    GrantedAuthority authority = new SimpleGrantedAuthority(roleName);

    Set<GrantedAuthority> authorities = new HashSet<>();
    authorities.add(authority);

    return new User(user.getEmail(), user.getPassword(), authorities);
}

    
}
