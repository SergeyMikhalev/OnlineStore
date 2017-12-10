package OnlineStore.requests;

public class CartOpRequest {

    // Класс операций над корзиной
    // 1 - добавить в корзину товары
    // 2 - убрать из корзины товары
    // 3 - убрать все единицы данного товара из корзины
    // 4 - очистить корзину
    // 5 - перевести корзину в состояние заказа

    private int command;
    private int prodId;
    private int count;

    public int getCommand() {
        return command;
    }

    public void setCommand(int command) {
        this.command = command;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }


    public CartOpRequest(int command, int prodId, int count) {
        this.command = command;
        this.prodId = prodId;
        this.count = count;
    }

    public CartOpRequest() {
    }

    @Override
    public String toString() {
        return "CartOpRequest{" +
                "command=" + command +
                ", prodId=" + prodId +
                ", count=" + count +
                '}';
    }
}

