package OnlineStore.repositories;

import OnlineStore.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository  extends JpaRepository<User,Integer>{

    User findByUsername(String Username);

}
