package OnlineStore.services;


import OnlineStore.requests.NewUserRequest;

import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface UserRegistrationService {
    List<String> validateAndRegister(NewUserRequest newUser);
}
