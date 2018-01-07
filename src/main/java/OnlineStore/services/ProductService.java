package OnlineStore.services;

import OnlineStore.entities.Product;
import OnlineStore.requests.NewProductRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface ProductService {


    Product findOne(Integer id);
    Iterable<Product> findAll();
    long count();
    Page<Product> findAll(Pageable pageable);
    Product save(NewProductRequest newProductRequest);

}
