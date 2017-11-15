package OnlineStore.Entities;

import javax.persistence.*;

@Entity
@Table(name = "ProductsInCarts")
public class ProductInCart {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "prodInCartId")
    private int id;

    //@Column(name = "cartId")
    //private int cartId;

 //   @Column(name = "prodId")
 //   private int prodId;

    @Column(name = "count")
    private int count;

    @ManyToOne
    @JoinColumn(name = "cartId")
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "prodId")//, insertable = false, updatable = false)
    private Product product;
    //=====================================================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCartId(Cart cart) {
        this.cart = cart;
    }

   /* public int getProdId() {
        return prodId;
    }
*/
  /*  public void setProdId(int prodId) {
        this.prodId = prodId;
    }
*/
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    //===========================================


    public ProductInCart(int count, Cart cart, Product product) {
        this.count = count;
        this.cart = cart;
        this.product = product;
    }

    public ProductInCart() {
    }

    //============================================


    @Override
    public String toString() {
        return "ProductInCart{" +
                "id=" + id +
               // ", prodId=" + prodId +
                ", count=" + count +
                ", product=" + product +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductInCart)) return false;

        ProductInCart that = (ProductInCart) o;

        return id == that.id;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
