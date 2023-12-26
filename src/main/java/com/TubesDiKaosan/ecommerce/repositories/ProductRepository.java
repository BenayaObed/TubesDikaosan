package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {

    @Query(value = "SELECT * FROM product WHERE name_product LIKE %?1% OR description LIKE %?1% OR category_id IN (SELECT category_id FROM categories WHERE category_name LIKE %?1%)", nativeQuery = true)
    List<Product> searchProduct(String keyword);

    @Query(value = "SELECT * FROM images WHERE product_id = ?1", nativeQuery = true)
    List<Images> findImagesByProductId(int product_id);

    @Query(value = "SELECT * FROM stock WHERE product_id = ?1", nativeQuery = true)
    List<Stock> findStockByProductId(int product_id);

    @Query(value = "SELECT * FROM product WHERE category_id IN (SELECT category_id FROM categories WHERE category_name = ?1)", nativeQuery = true)
    List<Product> findProductByCategoryName(String category_name);

    @Query(value = "SELECT * FROM product ORDER BY created_at ASC", nativeQuery = true)
    List<Product> findAllNewProduct();

    // hide product
    @Query(value = "UPDATE product SET visible = 0 WHERE product_id = ?1", nativeQuery = true)
    void hideProduct(int product_id);

    //     @Query(value = "SELECT product.*, SUM(orders_item.quantity) AS total_quantity FROM product JOIN orders_item ON product.product_id = orders_item.product_id GROUP BY product.product_id ORDER BY total_quantity DESC LIMIT 5", nativeQuery = true)
    // @Query(value = "SELECT * FROM product WHERE product_id IN (SELECT product_id FROM orders_item GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 5) AND product_id IN (SELECT product_id FROM reviews GROUP BY product_id ORDER BY COUNT(product_id) DESC LIMIT 5)", nativeQuery = true)
    
        // Best Seller product (top 5) by orders item quantity product and status orders is'delivered' and reviews 'rate > 3'
    @Query(value = "SELECT product.*, SUM(orders_item.quantity) AS total_quantity FROM product JOIN orders_item ON product.product_id = orders_item.product_id JOIN orders ON orders_item.order_id = orders.order_id JOIN reviews ON product.product_id = reviews.product_id WHERE orders.status = 'delivered' AND reviews.rate > 3 GROUP BY product.product_id ORDER BY total_quantity DESC LIMIT 5", nativeQuery = true)
    List<Product> getBestSeller();
}
