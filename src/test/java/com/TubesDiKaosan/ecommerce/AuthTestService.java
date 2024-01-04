package com.TubesDiKaosan.ecommerce;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;

import com.TubesDiKaosan.ecommerce.services.ActorServices.RolesService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.models.*;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.repositories.*;

import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class AuthTestService {

    // Models
    @Mock
    private Roles roles;

    @Mock
    private Users users;

    // Repositories
    @Mock
    private RolesRepository rolesRepository;

    @Mock
    private UserRepository usersRepository;

    // Services
    @InjectMocks
    private RolesService rolesService;

    @InjectMocks
    private List<UsersService> usersService;

    @BeforeEach
    void setUp() throws Exception {
        roles = new Roles();
        roles.setRole_id(1);
        roles.setRole_name("Admin");

        users = new Users();
        users.setUser_id("1");
        users.setFirst_name("Admin");
        users.setLast_name("Admin");
        users.setEmail("ADMIN@test.com");
        users.setPassword("admin");
        users.setRole(roles);
    }
    
    @Test
    void testAuth() throws Exception {
       for (UsersService usersService : usersService) {
           if (usersService instanceof UsersService) {
               when(usersRepository.findByEmail(users.getEmail())).thenReturn(users);
                when(usersRepository.findById(users.getUser_id())).thenReturn(Optional.of(users));
                usersService.login(users.getEmail(), users.getPassword());
                usersService.findDataByID(users.getUser_id());

                assert(usersService.login(users.getEmail(), users.getPassword()).getStatus() == 200);
                assert(usersService.findDataByID(users.getUser_id()).getStatus() == 200);
           }
       }
    }

    @Test
    void testRegister() throws Exception {
        UserRequest userRequest = new UserRequest();
        userRequest.setFirst_name("Admin");
        userRequest.setLast_name("Admin");
        userRequest.setEmail("admin1@test.com");
        userRequest.setPassword("admin");
        userRequest.setRole(roles.getRole_id());

        for (UsersService usersService : usersService) {
           if (usersService instanceof UsersService) {
                when(usersRepository.findByEmail(userRequest.getEmail())).thenReturn(null);
                when(usersRepository.save(users)).thenReturn(users);
                usersService.createData(userRequest);

                assert(usersService.createData(userRequest).getStatus() == 200);
           }
        }
    }
}
