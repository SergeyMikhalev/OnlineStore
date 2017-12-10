package OnlineStore.repositories;

import OnlineStore.entities.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository  extends JpaRepository<UserRole,Integer> {

    UserRole findByRolename(String rolename);
}
