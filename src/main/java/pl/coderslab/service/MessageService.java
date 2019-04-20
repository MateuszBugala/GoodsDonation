package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Message;
import pl.coderslab.model.User;
import pl.coderslab.repository.MessageRepository;

import javax.mail.MessagingException;
import java.util.List;

@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private EmailService emailService;
    @Autowired
    private UserServiceImpl userService;

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

    public void sendNewMessageNotification(Long id) {
        try {
            String messageText = findById(id).getMessageText();
            if (messageText.length()>100) {
                messageText = messageText.substring(0,100);
            }
            emailService.sendNewMessageNotification(userService.findById(1L), messageText);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Cannot send email notification to Admin");
        }
    }
}
