package OnlineStore.Controllers;

import OnlineStore.Entities.Product;
import OnlineStore.Services.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping("/")
    public String pagedProducts(Model model) {
        return "index";
    }

    @RequestMapping("/pagedproducts")
    public String pagedProducts(Model model, Pageable pageable) {
        Iterable<Product> products = productService.findAll( pageable);
        model.addAttribute("products",products);
        model.addAttribute("pageable",pageable);
        model.addAttribute("productsNumber",productService.count());
        return "pagedproducts";
    }

    @RequestMapping("/singleproduct")
    public String singleProduct(Model model, @RequestParam(value="prodId", required=false, defaultValue="1")int prodId)
    {
        Product singleProduct = productService.findOne(prodId);
        model.addAttribute("product", singleProduct);
        return "singleproduct";
    }


}
