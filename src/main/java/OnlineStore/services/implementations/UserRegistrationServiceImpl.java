package OnlineStore.services.implementations;

import OnlineStore.entities.Cart;
import OnlineStore.entities.User;
import OnlineStore.entities.UserRole;
import OnlineStore.repositories.CartRepository;
import OnlineStore.repositories.RoleRepository;
import OnlineStore.repositories.UserRepository;
import OnlineStore.requests.NewUserRequest;
import OnlineStore.services.CartService;
import OnlineStore.services.UserRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserRegistrationServiceImpl implements UserRegistrationService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private CartService cartService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    private AuthenticationManager authenticationManager;

    @Autowired
    public UserRegistrationServiceImpl(UserRepository userRepository,
                                       RoleRepository roleRepository,
                                       CartService cartService,
                                       AuthenticationManager authenticationManager) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.cartService = cartService;
        this.authenticationManager = authenticationManager;
    }


    public List<String> validate(NewUserRequest newUser) {
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

    @Override
    public User register(NewUserRequest newUserRequest)
    {
        UserRole roleBuyer = roleRepository.findByRolename("Buyer");
        Set<UserRole> roles = new HashSet<>();
        roles.add(roleBuyer);

        User newUserEntity = new User(newUserRequest.getUsername(), bCryptPasswordEncoder.encode(newUserRequest.getPassword()), roles);
        newUserEntity =  userRepository.saveAndFlush(newUserEntity);


        cartService.attachNewCartToUser(newUserEntity.getId());
        //Cart newUsersCart = new Cart(newUserEntity.getId());
        //cartRepository.saveAndFlush(newUsersCart);

        return newUserEntity;
    }

    @Override
    public void autologin(User user, String notEncryptedPassword)
    {
        //UsernamePasswordAuthenticationToken authToken  = new UsernamePasswordAuthenticationToken(user, user.getPassword() ,user.getAuthorities());
        UsernamePasswordAuthenticationToken authToken  = new UsernamePasswordAuthenticationToken(user, notEncryptedPassword ,user.getAuthorities());
        authenticationManager.authenticate(authToken);

        if (authToken.isAuthenticated())
        {
            SecurityContextHolder.getContext().setAuthentication(authToken);
            System.out.println("Автологин пользователя - "+user.getUsername()+" выполнен");
        }
    }
}
