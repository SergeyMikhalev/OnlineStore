package OnlineStore.entities;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Carts")
public class Cart{


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "cartId")
    private int id;

    @Column(name = "cartUser")
    private int userId;

    @Column(name = "Purchased")
    private boolean purchased;

    @Column(name = "deliveryAddress")
    private String deliveryAddress;

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private Set<ProductInCart> items = new HashSet<>();

    //===============================================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isPurchased() {
        return purchased;
    }

    public void setPurchased(boolean purchased) {
        this.purchased = purchased;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Set<ProductInCart> getItems() {
        return items;
    }

    public void setItems(Set<ProductInCart> items) {
        this.items = items;
    }

    //==========================================================


    public Cart(int id, int userId, boolean purchased, String deliveryAddress) {
        this.id = id;
        this.userId = userId;
        this.purchased = purchased;
        this.deliveryAddress = deliveryAddress;
    }

    public Cart(int userId) {
        this.userId = userId;
    }

    public Cart() {
    }

    //===========================================================


    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", userId=" + userId +
                ", purchased=" + purchased +
                ", deliveryAddress='" + deliveryAddress + '\'' +
                 ", items=" + items +
                '}';
    }

    //===========================================================


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Cart)) return false;

        Cart cart = (Cart) o;

        return id == cart.id;
    }

    @Override
    public int hashCode() {
        return id;
    }




}
