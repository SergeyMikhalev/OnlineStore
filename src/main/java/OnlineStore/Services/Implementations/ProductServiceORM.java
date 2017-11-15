package OnlineStore.Services.Implementations;

import OnlineStore.Entities.Product;
import OnlineStore.Repositories.ProductRepository;
import OnlineStore.Services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceORM implements ProductService {

    @Autowired
    private ProductRepository productRepository;


    public ProductServiceORM()
    {}

    protected ProductServiceORM(ProductRepository productRepository)
    {this.productRepository=productRepository;}


    @Override
    public Product findOne(Integer id) {
        return productRepository.findOne(id);
    }

    @Override
    public Iterable<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public long count() {
        return productRepository.count();
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }
}
