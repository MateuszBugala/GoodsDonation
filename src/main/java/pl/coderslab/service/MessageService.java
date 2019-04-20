package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Message;
import pl.coderslab.repository.MessageRepository;

import java.util.List;

@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public List<Message> findAll() {
        return messageRepository.findAll();
    }

    public Message findById(Long id) {
        return messageRepository.findOne(id);
    }

    public void save(Message entity) {
        messageRepository.save(entity);
    }

    public void delete(Long id) {
        messageRepository.delete(id);
    }
}
