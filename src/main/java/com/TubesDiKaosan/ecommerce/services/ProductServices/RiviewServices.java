package com.TubesDiKaosan.ecommerce.services.ProductServices;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Riviews;
import com.TubesDiKaosan.ecommerce.payloads.requests.RiviewRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.RiviewRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;

@Service
public class RiviewServices extends BaseServices<RiviewRequest, Integer> {
 
    @Autowired
    private RiviewRepository riviewRepository;

    @Override
    public Response getAll() throws SQLException {
        return new Response(HttpStatus.BAD_REQUEST.value(), "Bad Request", null);
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
        Riviews data = new Riviews();
        data.setProduct(request.getProduct());
        data.setRate(request.getRate());
        data.setComment(request.getComment());
        data.setUser(request.getUser());
        riviewRepository.save(data);
        return new Response(HttpStatus.OK.value(), "success", data);
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
