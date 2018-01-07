package OnlineStore.services;


import OnlineStore.entities.User;
import OnlineStore.requests.NewUserRequest;

import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface UserRegistrationService {
    List<String> validate(NewUserRequest newUser);
    User register(NewUserRequest newUserRequest);
    void autologin(User user, String notEncryptedPassword);
}
