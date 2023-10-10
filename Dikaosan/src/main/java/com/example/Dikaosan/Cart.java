import org.apache;
import java.util.Date;


public class Cart {
  private int id_cart;
    private int product;
    private int quantity;
    private Date dateAdd;

    public int getId_cart() {
        return id_cart;
    }

    public int getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public void setProduct(int product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }
}
