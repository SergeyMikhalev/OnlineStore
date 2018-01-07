package OnlineStore.validators;

import OnlineStore.requests.NewProductRequest;

import java.util.List;

public interface ProductValidator {
    List<String> validate(NewProductRequest newProductRequest);
}
