package com.TubesDiKaosan.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.TubesDiKaosan.ecommerce.models.Images;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

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

    @Query(value = "SELECT product.*, SUM(orders_item.quantity) AS total_quantity FROM product JOIN orders_item ON product.product_id = orders_item.product_id JOIN orders ON orders_item.order_id = orders.order_id JOIN reviews ON product.product_id = reviews.product_id WHERE orders.status = 'delivered' AND reviews.rate > 3 GROUP BY product.product_id ORDER BY total_quantity DESC LIMIT 5", nativeQuery = true)
    List<Product> getBestSeller();

    @Query(value = "SELECT\r\n" + //
            "    product.name_product,\r\n" + //
            "    categories.category_name,\r\n" + //
            "    COUNT(orders_item.product_id) AS order_count,\r\n" + //
            "    SUM(orders_item.quantity * product.price) AS total_revenue\r\n" + //
            "FROM\r\n" + //
            "    product\r\n" + //
            "JOIN\r\n" + //
            "    categories ON product.category_id = categories.category_id\r\n" + //
            "JOIN\r\n" + //
            "    orders_item ON orders_item.product_id = product.product_id\r\n" + //
            "JOIN\r\n" + //
            "    orders ON orders.order_id = orders_item.order_id\r\n" + //
            "WHERE\r\n" + //
            "    orders.status = 'delivered'\r\n" + //
            "GROUP BY\r\n" + //
            "    product.name_product, categories.category_name;\r\n" + //
            "", nativeQuery = true)
    List<Object[]> getReportProductDelivered();
}
