package OnlineStore.controllers;

import OnlineStore.entities.Cart;
import OnlineStore.entities.Product;
import OnlineStore.entities.UserRole;
import OnlineStore.requests.CartOpRequest;
import OnlineStore.requests.NewUserRequest;
import OnlineStore.services.CartService;
import OnlineStore.services.ProductService;


import OnlineStore.entities.User;
import OnlineStore.services.UserRegistrationService;
import OnlineStore.utils.FreemarkerHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class ProductController {

    @Autowired
    ProductService productService;
    @Autowired
    CartService cartService;
    //CartRepository cartRepository;

    @Autowired
    UserRegistrationService userRegistrationService;

    @RequestMapping("/")
    public String pagedProducts(Model model) {

        return "index";
    }

    @RequestMapping("/pagedproducts")
    public String pagedProducts(Model model, Pageable pageable, @AuthenticationPrincipal User user) {
        Iterable<Product> products = productService.findAll( pageable);

        Boolean canAddToCart = false;
        if (user!=null) {
            for (UserRole role : user.getRoles()) {
                if (role.getRolename().equals("Buyer")) {
                    canAddToCart = true;
                    break;
                }
            }
        }


        model.addAttribute("products",products);
        model.addAttribute("pageable",pageable);
        model.addAttribute("productsNumber",productService.count());
        model.addAttribute("canAddToCart", canAddToCart);


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
    public String cart(Model model, @AuthenticationPrincipal User user)
    {
        Cart cart = cartService.getCartByUserId(user.getId());
        System.out.println(cart);
        model.addAttribute("cart", cart);

        return "cart";

    }

    @RequestMapping("/login")
    public String login()
    {
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied()
    {
        return "403";
    }

    @RequestMapping("/addproduct")
    public String addProduct()
    {
        return "addproduct";
    }

    @RequestMapping(value = "/registration")
    public String registration() {return "registration";}

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerUser(Model model,
                               @RequestParam(name = "username", required = false, defaultValue = " ") String username,
                               @RequestParam(name = "password", required = false, defaultValue = " ") String password,
                               @RequestParam(name = "passwordConfirmation", required = false, defaultValue = "") String passwordConfirmation)
    {
        System.out.println(username+" : "+password+" : "+passwordConfirmation);
        List<String> validationErrors = userRegistrationService.validateAndRegister(new NewUserRequest(username, password, passwordConfirmation));

        if (validationErrors.isEmpty()) {
            return "index";
        }
        else {
            System.out.println(validationErrors);
            model.addAttribute("validationErrors", validationErrors);
            return "registration";
        }
    }

    @RequestMapping(value ="/cart",method = RequestMethod.PUT, consumes = "application/json", produces = "plain/text")
    public @ResponseBody String cartOp(Model model,@AuthenticationPrincipal User user, @RequestBody CartOpRequest request)
    {
        System.out.println("----------------------");

        Cart cart = null;

        if (user!=null) {
            System.out.println(request);
            if (request.getCommand() == 1)
                cart = cartService.alterProductCount(user.getId(), request.getProdId(), request.getCount());
            if (request.getCommand() == 2)
                cart = cartService.removeAllSpecificProduct(user.getId(), request.getProdId());
            if (request.getCommand() == 3)
                cart = cartService.removeAllProducts(user.getId());
        }

        model.addAttribute("cart",cart);

        String s = FreemarkerHelper.getStringFromTemplate("cart_items_table.ftl",model);

        System.out.println(s);

        return s;
    }

}
