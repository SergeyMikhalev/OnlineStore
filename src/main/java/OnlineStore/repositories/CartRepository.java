package OnlineStore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import OnlineStore.entities.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    Cart findByUserId(int userId);
}
