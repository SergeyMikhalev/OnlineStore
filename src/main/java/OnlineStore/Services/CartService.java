package OnlineStore.Services;

import OnlineStore.Entities.Cart;


public interface CartService  {
     /*
      Сервис работы с "тележкой" пользователя, в которой лежат товары
       реализует следующие функции
       1 - Получение тележки по идентификатору
       2 - Изменение количества товара в тележке (как добавление так и удаление)
       3 - Удалние из тележки всех единиц заданного товара
       4- Полная очистка тележки\ Удаление всех товаров

       Планируется добавление функции "Заказа" корзины
       т.е. все содержимое корзины переместиться в заказ.
       Корзина при этом станет пустой
     */

    /**
     *  Функция изменени количества товара в тележке
     * @param cartId Идентификатор тележки
     * @param prodId Идентификатор товара
     * @param count Добавляемое количество товара, может быть как положительным, так и отрицательным.
     *              При этом реализуется функция как добавления так и удаления товара из корзины
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
    Cart alterProductCount(int cartId, int prodId, int count);

    /**
     *  Получить тележку по идентификатору
     * @param id Идентификатор тележки
     * @return объект тележку типа Cart
     */
     Cart getCartById(int id);

    /**
     * Удаляет из тележки все имеющиеся единицы товара, идентификатор которого prodId
     * @param cartId Идентификатор тележки
     * @param prodId Идентификатор товара
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
     Cart removeAllSpecificProduct(int cartId, int prodId);

    /**
     *  Очищает тележку - удаляет из неё все имеющиеся товары
     * @param cartId Идентификатор тележки
     * @return Возвращает объект тележку с уже изменённым количеством товара. Тележка предварительн сохранена в БД
     */
     Cart removeAllProducts(int cartId);
}
