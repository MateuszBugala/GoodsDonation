package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Role;
import pl.coderslab.model.Token;
import pl.coderslab.model.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.TokenRepository;
import pl.coderslab.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private EmailService emailService;
    @Autowired
    private TokenRepository tokenRepository;

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) throws DuplicatedEmailException {
        if (userRepository.findByEmail(user.getEmail()) == null) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setEnabled(1);
            Role userRole = roleRepository.findByName("ROLE_USER");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            user.setActivated(false);
            String token = UUID.randomUUID().toString();
            userRepository.save(user);
            createVerificationToken(user, token);
            emailService.send(user.getEmail(), "Aktywuj swoje konto na GoodsDonation", user.getName(), token, "accountActivation");

        } else {
            throw new DuplicatedEmailException("There is already such email address in database");
        }

    }

    public static class DuplicatedEmailException extends Exception {
        public DuplicatedEmailException(String message) {
            super(message);
        }
    }

    public void saveAdmin(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }


    public User authorization(String emailCandidate, String passwordCandidate) {
        List<User> userList = userRepository.findAll();
        for (User user : userList) {
            if (emailCandidate.equals(user.getEmail())) {
                if (passwordEncoder.matches(user.getPassword(), passwordCandidate)) {
                    return user;
                }
            }
        }
        return null;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(Long id) {
        return userRepository.findOne(id);
    }

    public void update(User entity) {
        String pass = findById(entity.getId()).getPassword();
        entity.setPasswordNoEncryption(pass);
        userRepository.save(entity);
    }

    public void updateName(Long id, String name) {
        User user = userRepository.findOne(id);
        user.setName(name);
        userRepository.save(user);
    }

    public void changeStatus(Long id) {
        User user = userRepository.findOne(id);
        if (user.getEnabled() == 0) {
            user.setEnabled(1);
        } else {
            user.setEnabled(0);
        }
        userRepository.save(user);
    }

    public void delete(Long id) {
        Token token = tokenRepository.findByUser(findById(id));
        if (token != null) {
            deleteVerificationToken(token);
        }
        userRepository.delete(id);
    }

    public User getUser(String verificationToken) {
        Token token = tokenRepository.findByToken(verificationToken);
        if (token != null) {
            User user = token.getUser();
            return user;
        } else {
            return null;
        }
    }

    public Token getVerificationToken(String VerificationToken) {
        return tokenRepository.findByToken(VerificationToken);
    }

    public void createVerificationToken(User user, String token) {
        Token myToken = new Token(token, user);
        tokenRepository.save(myToken);
    }

    public void deleteVerificationToken(Token token) {
        tokenRepository.delete(token.getId());
    }

    public void resendVerificationToken(String email) {
        User user = userRepository.findByEmailAndActivated(email, false);
        if (user != null) {
            Token oldToken = tokenRepository.findByUser(user);
            if (LocalDateTime.now().isAfter(oldToken.getExpiryDate())) {
                deleteVerificationToken(oldToken);
                String newToken = UUID.randomUUID().toString();
                createVerificationToken(user, newToken);
                emailService.send(user.getEmail(),"Aktywuj swoje konto na GoodsDonation", user.getName(), newToken, "accountActivation");
            }
        }
    }

    public void resetPassword(String email) {
        User user = userRepository.findByEmailAndActivated(email, true);
        if (user != null) {
            Token oldToken = tokenRepository.findByUser(user);
            if (oldToken != null) {
                deleteVerificationToken(oldToken);
            }
            String newToken = UUID.randomUUID().toString();
            createVerificationToken(user, newToken);
            emailService.send(user.getEmail(), "Reset hasła GoodsDonation",user.getName(), newToken, "resetPassword");
        }
    }

}
