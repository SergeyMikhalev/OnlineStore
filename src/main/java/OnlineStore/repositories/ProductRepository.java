package OnlineStore.repositories;

import OnlineStore.entities.Product;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

}
