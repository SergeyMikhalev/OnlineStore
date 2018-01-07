package OnlineStore.validators.implementations;

import OnlineStore.requests.NewProductRequest;
import OnlineStore.validators.ProductValidator;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ProductValidatorImpl implements ProductValidator {
    public List<String> validate(NewProductRequest newProductRequest)
    {
        List<String> validationErros = new ArrayList<>();

        if (newProductRequest==null) {
            validationErros.add("Нет объекта для валидации");
            return validationErros;
        }

        if (newProductRequest.getProdName()==null) {validationErros.add("Название продукта  не задано");}
        else {
            if (newProductRequest.getProdName().length() < 10) {
                validationErros.add("Название продукта слишком короткое");
            }

            if (newProductRequest.getProdName().length() > 20) {
                validationErros.add("Название продукта слишком длинное");
            }
        };

        if (newProductRequest.getProdDesc()==null) {validationErros.add("Описание продукта  не задано");}
        else {
            if (newProductRequest.getProdDesc().length() < 10) {
                validationErros.add("Описание продукта слишком короткое");
            }


            if (newProductRequest.getProdDesc().length() > 40) {
                validationErros.add("Описание продукта слишком длинное");
            }
        }

        try {
            Integer cost  = Integer.parseInt(newProductRequest.getProdCost());

            if (cost<0) {validationErros.add("Цена продукта должна быть положительным целым числом");}
        } catch (NumberFormatException n)
        {validationErros.add("Цена продукта должна быть целым числом");}

        return validationErros;
    }
}
