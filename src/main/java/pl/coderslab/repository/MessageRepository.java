package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Message;

public interface MessageRepository extends JpaRepository<Message, Long> {
}
