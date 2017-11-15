package OnlineStore.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import OnlineStore.Entities.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {

}
