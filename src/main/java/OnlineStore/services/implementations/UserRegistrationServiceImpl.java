package OnlineStore.services.implementations;

import OnlineStore.entities.Cart;
import OnlineStore.entities.User;
import OnlineStore.entities.UserRole;
import OnlineStore.repositories.CartRepository;
import OnlineStore.repositories.RoleRepository;
import OnlineStore.repositories.UserRepository;
import OnlineStore.requests.NewUserRequest;
import OnlineStore.services.UserRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserRegistrationServiceImpl implements UserRegistrationService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private CartRepository cartRepository;

    @Autowired
    public UserRegistrationServiceImpl(UserRepository userRepository, RoleRepository roleRepository, CartRepository cartRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.cartRepository = cartRepository;
    }



    @Override
    public List<String> validateAndRegister(NewUserRequest newUser) {
        List<String> validationErrors = validate(newUser);
        if (validationErrors.isEmpty())
        {register(newUser);}

        return validationErrors;
    }

    private List<String> validate(NewUserRequest newUser) {
        List<String> validationErrors = new ArrayList<>();

        //Несовподение паролей
        if (!newUser.getPassword().equals(newUser.getPasswordConfirmation()))
        {
            validationErrors.add("Пароль и подтверждение пароля не совпадают");
        }
        // Пользователь с таким именем уже есть в базе
        if (userRepository.findByUsername(newUser.getUsername())!=null)
        {
            validationErrors.add("Пользователь с таким именем уже существует");
        }

        return validationErrors;
    }

    private void register(NewUserRequest newUser)
    {
        UserRole roleBuyer = roleRepository.findByRolename("Buyer");
        Set<UserRole> roles = new HashSet<>();
        roles.add(roleBuyer);

        User newUserEntity = new User(newUser.getUsername(), newUser.getPassword(), roles);
        newUserEntity =  userRepository.saveAndFlush(newUserEntity);

        Cart newUsersCart = new Cart(0,newUserEntity.getId(),false, null);
        cartRepository.saveAndFlush(newUsersCart);

    }
}
