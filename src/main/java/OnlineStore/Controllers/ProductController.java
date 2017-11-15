package OnlineStore.Controllers;

import OnlineStore.Entities.Cart;
import OnlineStore.Entities.Product;
import OnlineStore.Requests.CartOpRequest;
import OnlineStore.Services.CartService;
import OnlineStore.Services.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ProductController {

    @Autowired
    ProductService productService;
    @Autowired
    CartService cartService;
    //CartRepository cartRepository;

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

    @RequestMapping("/cart")
    public String cart(Model model)
    {
        Cart cart = cartService.getCartById(1);
        System.out.println(cart);
        model.addAttribute("cart", cart);

        return "cart";

    }

    @RequestMapping(value ="/cart",method = RequestMethod.POST, consumes = "application/json")
    public String cartOp(Model model, @RequestBody CartOpRequest request)
    {
        System.out.println("----------------------");
        System.out.println(request);
        if (request.getCommand() ==1)
            cartService.alterProductCount(1,request.getProdId(),request.getCount());
        if (request.getCommand()==2)
            cartService.removeAllSpecificProduct(1,request.getProdId());
        if (request.getCommand()==3)
            cartService.removeAllProducts(1);

        return "redirect:/";
    }

}
