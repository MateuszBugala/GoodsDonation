package pl.coderslab.service;

import pl.coderslab.model.User;

public interface UserService {
    User findByEmail(String email);
    void saveUser(User user) throws Exception;
}