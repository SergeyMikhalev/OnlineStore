package OnlineStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import OnlineStore.entities.Cart;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    Cart findByUserIdAndPurchasedFalse(int userId);

    @Modifying
    @Transactional
    @Query("UPDATE Cart c SET purchased = True, delivery_address = :targetAddress WHERE cart_id = :targetId and purchased = False ")
    void purchaseCart(@Param("targetId") int cartId, @Param("targetAddress") String deliveryAddress);


}
