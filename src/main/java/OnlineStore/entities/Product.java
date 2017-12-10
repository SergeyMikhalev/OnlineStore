package OnlineStore.entities;

// Сущность "Продукт" из базы данных - представляет собой товар магазина
// заготовка под  Entity
//


import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "Products")
public class Product implements Serializable{

    // Поля объекта

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "prodId")
    protected int id;          // Уникальный идентификатор товара

    @Column(name = "prodName")
    protected String name;     // Название товара

    @Column(name = "prodDesc")
    private String desc;     // Описание товара

    @Column(name = "prodPicturePath")
    private String imgPath;  // Путь к изображению товара

    @Column(name = "prodCost")
    private int cost;        // Цена товара за единицу

    // Конструкторы


    public Product() {
    }

    public Product(int id, String name, String desc, String imgPath, int cost) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.imgPath = imgPath;
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", cost=" + cost +
                '}';
    }

    //Геттеры, необходимы для работы шаблонов FreeMaker
    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public String getDesc() {
        return desc;
    }

    public String getImgPath() {
        return imgPath;
    }

    public int getCost() {
        return cost;
    }

    //Сеттеры


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;

        Product product = (Product) o;

        return id == product.id;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
