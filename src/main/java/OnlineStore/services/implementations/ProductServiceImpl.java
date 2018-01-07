package OnlineStore.services.implementations;

import OnlineStore.entities.Product;
import OnlineStore.repositories.ProductRepository;
import OnlineStore.requests.NewProductRequest;
import OnlineStore.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {


    private ProductRepository productRepository;


    public ProductServiceImpl()
    {}

    @Autowired
    protected ProductServiceImpl(ProductRepository productRepository)
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

    @Override
    public Product save(NewProductRequest newProductRequest) {
        Product product = null;
        try {
            product = new Product(0, newProductRequest.getProdName(), newProductRequest.getProdDesc(), null, Integer.parseInt(newProductRequest.getProdCost()));
            product = productRepository.save(product);
        } catch (NumberFormatException e ){}
        finally {
            return product;
        }

    }
}
