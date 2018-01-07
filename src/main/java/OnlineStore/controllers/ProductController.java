package OnlineStore.controllers;

import OnlineStore.entities.Cart;
import OnlineStore.entities.Product;
import OnlineStore.entities.UserRole;
import OnlineStore.requests.CartOpRequest;
import OnlineStore.requests.NewProductRequest;
import OnlineStore.requests.NewUserRequest;
import OnlineStore.services.CartService;
import OnlineStore.services.ProductService;


import OnlineStore.entities.User;
import OnlineStore.services.UserRegistrationService;
import OnlineStore.validators.ProductValidator;
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

    @Autowired
    ProductValidator productValidator;


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
    public String cart(Model model, @AuthenticationPrincipal User user, @RequestParam(value = "prePurchased", required = false, defaultValue = "false") Boolean prePurchased)
    {
        Cart cart = cartService.getCartByUserId(user.getId());
        System.out.println(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("prePurchased", prePurchased);

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
    public String showAddProdForm()
    {
        return "addproduct";
    }


    // Добавление продукта Post запрос
    @RequestMapping(value = "/addproduct", method = RequestMethod.POST)
    public String addProduct(Model model,
                             @RequestParam(name = "prodName", required = false, defaultValue = " ") String prodName,
                             @RequestParam(name = "prodDesc", required = false, defaultValue = " ") String prodDesc,
                             @RequestParam(name = "prodCost", required = false, defaultValue = " ") String prodCost
    )
    {

        NewProductRequest newProductRequest = new NewProductRequest(prodName,prodDesc,prodCost);
        List<String> validationErrors = productValidator.validate(newProductRequest);

        if (validationErrors.isEmpty())
        {
            System.out.println(prodName+" : "+prodDesc+" : "+prodCost);
            productService.save(newProductRequest);
            return "/";
        }
        else
        {
         model.addAttribute("validationErrors", validationErrors);
         return "/addproduct";
        }
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
        NewUserRequest newUserRequest = new NewUserRequest(username, password, passwordConfirmation);
        List<String> validationErrors = userRegistrationService.validate(newUserRequest);

        if (validationErrors.isEmpty()) {
            User registeredUser= userRegistrationService.register(newUserRequest);
            userRegistrationService.autologin(registeredUser, newUserRequest.getPassword());
            return "index";
        }
        else {
            System.out.println(validationErrors);
            model.addAttribute("validationErrors", validationErrors);
            return "registration";
        }
    }

    @RequestMapping(value ="/cart",method = RequestMethod.PUT, consumes = "application/json")
    public String cartOp(Model model,@AuthenticationPrincipal User user, @RequestBody CartOpRequest request)
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


        return "cart_items_table";
    }

    @RequestMapping(value = "/purchase", method = RequestMethod.POST)
    public String purchase(Model model,
                           @AuthenticationPrincipal User user,
                           @RequestParam(name = "deliveryAddress") String deliveryAddress)
    {
        if (user==null)
        {
            return "redirect:/login";
        }
        else {
            Cart cart = cartService.getCartByUserId(user.getId());
            cartService.purchaseCart(cart.getId(),deliveryAddress);
            cartService.attachNewCartToUser(user.getId());
            return "redirect:/";
        }

    }

}
