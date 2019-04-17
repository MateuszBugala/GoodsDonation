package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Token;
import pl.coderslab.model.User;

public interface TokenRepository extends JpaRepository<Token, Long> {
    Token findByToken(String token);
    Token findByUser(User user);
}
