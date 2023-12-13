package com.TubesDiKaosan.ecommerce.services.ProductServices;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.payloads.requests.ImagesProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.StockProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.ImagesRepository;
import com.TubesDiKaosan.ecommerce.repositories.ProductRepository;
import com.TubesDiKaosan.ecommerce.repositories.StockRepository;
import com.TubesDiKaosan.ecommerce.services.BaseServices;

@Service
public class ProductService extends BaseServices<ProductRequest, Integer> {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ImagesRepository imagesRepository;
    @Autowired
    private StockRepository stockRepository;
    @Autowired
    private CategoryService categoryService;

    @Override
    public Response getAll() throws SQLException {
        if (productRepository.findAll().isEmpty()) {
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        } else {
            List<Product> productList = productRepository.findAll();
            for (Product product : productList) {
                product.setImages(imagesRepository.findImagesByProductId(product.getProduct_id()));
                product.setStock(stockRepository.findStockByProductId(product.getProduct_id()));
            }

            return new Response(HttpStatus.OK.value(), "Success", productList);
        }
    }

    @Override
    public Response findDataByID(Integer id) throws SQLException {
        if (productRepository.findById(id).isPresent()) {
            Product product = productRepository.findById(id).get();
            product.setImages(imagesRepository.findImagesByProductId(product.getProduct_id()));
            product.setStock(stockRepository.findStockByProductId(product.getProduct_id()));

            return new Response(HttpStatus.OK.value(), "Success", product);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found!", null);
        }
    }

    @Override
    public Response deleteDataByID(Integer id) throws SQLException {
        if (productRepository.findById(id).isPresent()) {
            List<Images> images = imagesRepository.findImagesByProductId(id);
            for (Images image : images) {
                imagesRepository.deleteById(image.getImage_id());
            }

            List<Stock> stocks = stockRepository.findStockByProductId(id);
            for (Stock stock : stocks) {
                stockRepository.deleteById(stock.getStock_id());
            }

            productRepository.deleteById(id);
            return new Response(HttpStatus.OK.value(), "success", null);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found!", null);
        }
    }

    @Override
    public Response updateDataById(Integer id, ProductRequest request) throws SQLException {
        if (productRepository.findById(id).isPresent()) {
            Product product = productRepository.findById(id).get();

            product.setName_product(request.getName_product());
            product.setPrice(request.getPrice());
            product.setDescription(request.getDescription());
            product.setVisible(request.getVisible());

            // Set Category
            Response category = categoryService.findDataByID(request.getCategory_id());
            if (category.getStatus() == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid category ID", null);
            }
            product.setCategory((Category) category.getData());

            // print product.getImages()
            // Create separate lists for existing and new images
            List<Images> existingImages = (List<Images>)imagesRepository.findImagesByProductId(id);
            System.out.println("Images:");
            for (Images img : existingImages) {
                System.out.println("> " + img.getImage_id());
            }
            List<Images> newImages = new ArrayList<>();

            for (ImagesProductRequest imagesRequest : request.getImages()) {
                Images image = new Images();
                Integer imageId = imagesRequest.getImage_id();

                // If image_id exists, update existing image
                if (imageId != null) {
                    Optional<Images> existingImage = existingImages.stream()
                            .filter(img -> img.getImage_id() == imageId)
                            .findFirst();
                    
                    
                    // If image found, update its details
                    if (existingImage.isPresent()) {
                        existingImage.get().setImage(imagesRequest.getImage());
                    }
                } else {
                    // If no image_id, add new image
                    image.setImage(imagesRequest.getImage());
                    image.setProduct(product);
                    newImages.add(image);
                }
            }
            System.out.println(existingImages.size() + " " + newImages.size());
            product.setImages(existingImages);
            product.getImages().addAll(newImages);

            // Create separate lists for existing and new stock
            List<Stock> existingStock = stockRepository.findStockByProductId(id);
            List<Stock> newStock = new ArrayList<>();

            for (StockProductRequest stockRequest : request.getStock()) {
                Stock stock = new Stock();
                Integer stockId = stockRequest.getStock_id();

                // If stock_id exists, update existing stock
                if (stockId != null) {
                    Optional<Stock> existingStockItem = existingStock.stream()
                            .filter(s -> s.getStock_id() == stockId)
                            .findFirst();

                    // If stock found, update its details
                    if (existingStockItem.isPresent()) {
                        existingStockItem.get().setSize(stockRequest.getSize());
                        existingStockItem.get().setQuantity(stockRequest.getQuantity());
                        existingStockItem.get().setColor(stockRequest.getColor());
                    }
                } else {
                    // If no stock_id, add new stock
                    stock.setSize(stockRequest.getSize());
                    stock.setQuantity(stockRequest.getQuantity());
                    stock.setColor(stockRequest.getColor());
                    stock.setProduct(product);
                    newStock.add(stock);
                }
            }

            // Update Stock in product
            product.setStock(existingStock);
            product.getStock().addAll(newStock);

            // Save the updated product
            productRepository.save(product);

            return new Response(HttpStatus.OK.value(), "success", product);
        } else {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found!", null);
        }
    }

    @Override
    public Response createData(ProductRequest request) throws SQLException {
        try {
            Response category = categoryService.findDataByID(request.getCategory_id());
            if (category.getStatus() == null) {
                return new Response(HttpStatus.BAD_REQUEST.value(), "Invalid category ID", null);
            }

            // Create a new product
            Product product = new Product();
            product.setName_product(request.getName_product());
            product.setCategory((Category) category.getData());
            product.setPrice(request.getPrice());
            product.setDescription(request.getDescription());
            product.setVisible(request.getVisible());

            // Set Images
            List<Images> imagesList = new ArrayList<>();
            for (ImagesProductRequest imagesRequest : request.getImages()) {
                Images image = new Images();
                image.setImage(imagesRequest.getImage());
                image.setProduct(product);
                imagesList.add(image);
            }
            product.setImages(imagesList);

            // Set Stock
            List<Stock> stockList = new ArrayList<>();
            for (StockProductRequest stockRequest : request.getStock()) {
                Stock stock = new Stock();
                stock.setSize(stockRequest.getSize());
                stock.setQuantity(stockRequest.getQuantity());
                stock.setColor(stockRequest.getColor());
                stock.setProduct(product);

                stockList.add(stock);
            }
            product.setStock(stockList);

            // Save the product
            productRepository.save(product);

            return new Response(HttpStatus.OK.value(), "Success", product);
        } catch (Exception e) {
            return new Response(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Error creating product", null);
        }
    }

    public Response searchProduct(String keyword) throws SQLException {
        if (productRepository.searchProduct(keyword).isEmpty()) {
            return new Response(HttpStatus.NOT_FOUND.value(), "Data not found!", null);
        } else {
            List<Product> productList = productRepository.searchProduct(keyword);
            for (Product product : productList) {
                product.setImages(imagesRepository.findImagesByProductId(product.getProduct_id()));
                product.setStock(stockRepository.findStockByProductId(product.getProduct_id()));
            }

            return new Response(HttpStatus.OK.value(), "Success", productList);
        }
    }
}
