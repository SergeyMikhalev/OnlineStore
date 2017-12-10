package OnlineStore.services.implementations;

import OnlineStore.entities.Cart;
import OnlineStore.entities.Product;
import OnlineStore.entities.ProductInCart;
import OnlineStore.repositories.CartRepository;
import OnlineStore.repositories.ProductRepository;
import OnlineStore.services.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {


    private ProductRepository productRepository;
    private CartRepository cartRepository;

    @Autowired
    public CartServiceImpl(ProductRepository productRepository, CartRepository cartRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
    }

    /**
     *  Получить тележку по идентификатору
     * @param id Идентификатор тележки
     * @return объект тележку типа Cart
     */
    @Override
    public Cart getCartById(int id)
    {
        return cartRepository.findOne(id);
    }

    /**
     *  Функция изменени количества товара в тележке
     * @param userId Идентификатор тележки
     * @param prodId Идентификатор товара
     * @param count Добавляемое количество товара, может быть как положительным, так и отрицательным.
     *              При этом реализуется функция как добавления так и удаления товара из корзины
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
    @Override
    public Cart alterProductCount(int userId, int prodId, int count) {

        Cart cart = cartRepository.findByUserId(userId);
        if (cart==null) {
            System.out.println("Тележка с ID=" + userId + " запрашиваемая для выполнения операции добавления товара не обнаружена");
            return null;
        }

        Product product = productRepository.findOne(prodId);
        if (product==null) {
            System.out.println("Товар с ID=" + userId + " запрашиваемый для выполнения операции добавления товара в тележку не обнаружен");
            return cart;
        }

        ProductInCart picForOperations = findProductInCart(cart,product);

        if (picForOperations==null) {                           // Если такого товара в тележке нет
            if (count>0){putNewProduct(cart, product, count);}  // добавить новый товар\добавить элемент в Set товаров\новую запись в таблицу
        }
        else
            {
            if (picForOperations.getCount() + count > 0)        // Если такой товар уже есть, проверям окажется ли его >0 при изменении количества
                { alterExistingProductCount(picForOperations, count); }    //>0 - изменяем количество товара
            else
                { cart.getItems().remove(picForOperations); }                       // <0 - удаляем товар из тележки (элемент из множества\запись из БД)
            }

        cartRepository.saveAndFlush(cart);
        return cart;

    }

    /**
     * Удаляет из тележки все имеющиеся единицы товара, идентификатор которого prodId
     * @param userId Идентификатор тележки
     * @param prodId Идентификатор товара
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
    @Override
    public Cart removeAllSpecificProduct(int userId, int prodId) {


        Cart cart = cartRepository.findByUserId(userId);
        if (cart==null) {
            System.out.println("Тележка с ID=" + userId + " запрашиваемая для выполнения операции добавления товара не обнаружена");
            return null;
        }

        Product product = productRepository.findOne(prodId);
        if (product==null) {
            System.out.println("Товар с ID=" + userId + " запрашиваемый для выполнения операции добавления товара в тележку не обнаружен");
            return cart;
        }


        ProductInCart targetProductInCart = findProductInCart(cart, product);
        if (targetProductInCart!=null) {
            cart.getItems().remove(targetProductInCart);
            cartRepository.saveAndFlush(cart);
        }

        return cart;
    }

    /**
     *  Очищает тележку - удаляет из неё все имеющиеся товары
     * @param userId Идентификатор тележки
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
    @Override
    public Cart removeAllProducts(int userId) {

        Cart cart = cartRepository.findByUserId(userId);
        if (cart==null) {
            System.out.println("Тележка с ID=" + userId + " запрашиваемая для выполнения операции добавления товара не обнаружена");
            return null;
        }

        cart.getItems().clear();
        cartRepository.saveAndFlush(cart);

        return cart;
    }

    @Override
    public Cart getCartByUserId(int userId) {
        return cartRepository.findByUserId(userId);
    }

    //============================= Конец реализации интерфейса CartService ======================

//============================================================================================

    /**
     * Положить новый товар в тележку (товар, единиц которого в тележке ещё нет)
     * принцыпиально отличается от работы с товаром который в тележке уже есть
     * необходимостью добавлять новый элемент во множество "кучек" товаров в корзине
     * @param cart      Тележка, в которую нужно положить товар
     * @param product   товар, который нужно положить
     * @param count     количество товара
     */
    private void putNewProduct(Cart cart, Product product, int count) {
        ProductInCart productInCart = new ProductInCart();
        productInCart.setProduct(product);
        productInCart.setCount(count);
        productInCart.setCartId(cart);

        cart.getItems().add(productInCart);
    }

    /**
     * Изменить количество товара в "кучке" товара внутри тележки
     *  @param cartItemToAlter объект "товар в корзине" (собраные в условную кучку товары заданного типа в корзине)
     *                        количество элементов в котором будет изменяться
     * @param count число, на которое надо изменить количество товара в корзинке (уменьшить\увеличить)
     */
    private void alterExistingProductCount(ProductInCart cartItemToAlter, int count) {

        if (cartItemToAlter!=null)
        {
            if ((long)count+cartItemToAlter.getCount()>Integer.MAX_VALUE)
                {cartItemToAlter.setCount(Integer.MAX_VALUE);}
            else
                {cartItemToAlter.setCount(cartItemToAlter.getCount()+count);}
        }

    }

    /**
     *  Найти "кучку" заданного товара в тележке
     * @param cart  тележка
     * @param product товар
     * @return Возвращает "кучку" товара для данной тележки, если таковой ("кучки") нет, возвращает null
     */
    private ProductInCart findProductInCart(Cart cart, Product product)
    {
        ProductInCart tartgetProductInCart = null;
        for (ProductInCart productInCart : cart.getItems()) {
            if (productInCart.getProduct().equals(product) ) {
                tartgetProductInCart = productInCart;
                break;
            }
        }

        return  tartgetProductInCart;
    }


}
