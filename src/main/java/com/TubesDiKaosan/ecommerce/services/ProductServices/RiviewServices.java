package com.TubesDiKaosan.ecommerce.services.ProductServices;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Riviews;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.RiviewRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.RiviewRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;

@Service
public class RiviewServices extends BaseServices<RiviewRequest, Integer> {
 
    @Autowired
    private RiviewRepository riviewRepository;

    @Autowired
    private ProductService productServices;

    @Autowired
    private List<UsersService> users;

    @Override
    public Response getAll() throws SQLException {
        List<Riviews> data = riviewRepository.findAll();
        return new Response(HttpStatus.OK.value(), "success", data);
    }

    @Override
    public Response findDataByID(Integer id) throws SQLException { // GET RIVIEW ID
        if (riviewRepository.findById(id).isPresent()) {
            return new Response(HttpStatus.OK.value(), "success", riviewRepository.findById(id).get());
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response deleteDataByID(Integer id) throws SQLException { // DELETE RIVIEW ID
        if (riviewRepository.findById(id).isPresent()) {
            riviewRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response updateDataById(Integer id, RiviewRequest request) throws SQLException { // EDIT RIVIEW ID
        if (riviewRepository.findById(id).isPresent()) {

            Riviews data = riviewRepository.findById(id).get();

            data.setRate(request.getRate());
            data.setComment(request.getComment());

            riviewRepository.save(data);

            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response createData(RiviewRequest request) throws SQLException { // CREATE RIVIEW
        for (UsersService user : users) {
            if (user instanceof UsersService) {
                Response response = ((UsersService) user).findDataByID(request.getUser());
                if (response.getStatus() != HttpStatus.OK.value()) {
                    return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid user ID!", null);
                }
                Users dataUser = (Users) response.getData();
                Product dataProduct = (Product) productServices.findDataByID(request.getProduct()).getData();
                Riviews data = new Riviews();
                System.out.println(dataUser.getEmail());
                data.setProduct(dataProduct);
                data.setUser(dataUser);
                data.setRate(request.getRate());
                data.setComment(request.getComment());
                riviewRepository.save(data);
                return new Response(HttpStatus.OK.value(), "success", data);
            }
        }
        return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }


    public Response riviewsByProduct(Integer productID) {
        if (riviewRepository.riviewsByProduct(productID).isEmpty()) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
        } else {
            List<Riviews> data = riviewRepository.riviewsByProduct(productID);
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

}
