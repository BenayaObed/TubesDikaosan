package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.payloads.requests.RoleRequest;
import com.TubesDiKaosan.ecommerce.services.RolesService;

@Controller
@RequestMapping("/api")
public class RolesController {
    @Autowired
    private RolesService rolesService;

    @RequestMapping("/roles")
    public ResponseEntity<?> getAllRoles() throws Exception{
        return ResponseEntity.ok().body(rolesService.getAll());
    }

    @PostMapping("/roles/submit")
    public ResponseEntity<?> submitRoles(@RequestBody RoleRequest request) throws Exception{
        return ResponseEntity.ok().body(rolesService.createData(request));
    }

    @PostMapping("/roles/update")
    public ResponseEntity<?> updateRoles(@RequestBody RoleRequest request, @RequestParam Integer id) throws Exception{
        return ResponseEntity.ok().body(rolesService.updateDataById(id,request));
    }

    @PostMapping("/roles/delete")
    public ResponseEntity<?> deleteRoles(Integer id) throws Exception{
        return ResponseEntity.ok().body(rolesService.deleteDataByID(id));
    }

    @GetMapping("/roles/search")
    public ResponseEntity<?> searchRoles(@RequestParam Integer id) throws Exception{
        return ResponseEntity.ok().body(rolesService.findDataByID(id));
    }

}
