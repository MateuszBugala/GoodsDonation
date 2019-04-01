package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Role;
import pl.coderslab.model.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

//    pytanie dlaczego ten konstruktor; czemu nie @Autowired powyżej?
//    public UserServiceImpl(UserRepository userRepository,
//                           RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
//        this.passwordEncoder = passwordEncoder;
//        this.userRepository = userRepository;
//        this.roleRepository = roleRepository;
//    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
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

    public void delete(Long id) {
        userRepository.delete(id);
    }
}
