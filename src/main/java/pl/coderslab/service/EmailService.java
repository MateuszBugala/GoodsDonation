package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import pl.coderslab.model.Token;
import pl.coderslab.model.User;
import pl.coderslab.repository.TokenRepository;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

@Component
public class EmailService {

    @Autowired
    private TemplateEngine templateEngine;
    @Autowired
    private TokenRepository tokenRepository;

    private String generateMailHtml(String token, String name, String email, String templateFileName) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("token", token);
        variables.put("name", name);
        variables.put("email", email);
        String output = this.templateEngine.process(templateFileName, new Context(Locale.getDefault(), variables));
        return output;
    }

    public void sendAccountActivationEmail(User user) {
        send(user.getEmail(), "Aktywuj swoje konto na GoodsDonation", user.getName(), tokenRepository.findByUser(user).getToken(), "accountActivation");
    }

    public void sendResetPasswordEmail(User user) {
        send(user.getEmail(), "Reset hasła GoodsDonation", user.getName(), tokenRepository.findByUser(user).getToken(), "resetPassword");
    }

    private void send(String to, String subject, String name, String token, String emailTemplate) {

        Properties prop = new Properties();
        try (InputStream input = new FileInputStream("src/main/resources/mail.properties")) {
            prop.load(input);
        } catch (IOException io) {
            io.printStackTrace();
            System.err.println("Cannot open and load mail.properties file");
        }

        Session session = Session.getDefaultInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(prop.getProperty("mail.from"), prop.getProperty("password"));
                    }
                });

        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setContent(generateMailHtml(token, name, to, emailTemplate), "text/html; charset=UTF-8");
            Transport.send(message);
            System.out.println("Email sent successfully");
        } catch (MessagingException e) {
//            throw new RuntimeException(e);
            System.err.println("Cannot send email" + e);
        }

    }

}
