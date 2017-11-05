package OnlineStore.Repositories;

import OnlineStore.Entities.Product;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

}
