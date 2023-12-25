package com.TubesDiKaosan.ecommerce.services.PaymentServices;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.PaymentMethod;
import com.TubesDiKaosan.ecommerce.payloads.requests.PaymentMethodRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.PaymentMethodRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;

import java.util.List;

@Service
public class PaymentMethodService extends BaseServices<PaymentMethodRequest, Integer> {
    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Override
    public Response getAll() throws SQLException {
        if (paymentMethodRepository.findAll().isEmpty())
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<PaymentMethod> data = paymentMethodRepository.findAll();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @Override
    public Response findDataByID(Integer id) throws SQLException {
        if (paymentMethodRepository.findById(id).isPresent()) {
            PaymentMethod data = paymentMethodRepository.findById(id).get();
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response deleteDataByID(Integer id) throws SQLException {
        if (paymentMethodRepository.findById(id).isPresent()) {
            paymentMethodRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response updateDataById(Integer id, PaymentMethodRequest request) throws SQLException {
        if (paymentMethodRepository.findById(id).isPresent()) {
            PaymentMethod data = paymentMethodRepository.findById(id).get();
            data.setPayment_method_name(request.getPayment_method_name());
            data.setNorek(request.getNorek());
            data.setIsActive(request.getIsActive());
            paymentMethodRepository.save(data);
            return new Response(HttpStatus.OK.value(), "success", data);
        } else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    @Override
    public Response createData(PaymentMethodRequest request) throws SQLException {
        if (this.findByName(request.getPayment_method_name()) != null)
            return new Response(HttpStatus.BAD_REQUEST.value(), "Payment method name already exist!", null);
        PaymentMethod data = new PaymentMethod();
        data.setPayment_method_name(request.getPayment_method_name());
        data.setNorek(request.getNorek());
        data.setIsActive(request.getIsActive());
        paymentMethodRepository.save(data);
        return new Response(HttpStatus.OK.value(), "success", data);
    }

    public Response findByName(String payment_method_name) {
        if (paymentMethodRepository.findByName(payment_method_name) != null)
            return new Response(HttpStatus.OK.value(), "success", paymentMethodRepository.findByName(payment_method_name));
        else
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found", null);
    }

    public PaymentMethod getPaymentMethod(Integer bank) {
        return paymentMethodRepository.findById(bank).get();
    }
}
