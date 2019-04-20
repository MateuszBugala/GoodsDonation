package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
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

    public void sendAccountActivationEmail(User user) throws MessagingException {
        send(user.getEmail(), "Aktywuj swoje konto na GoodsDonation", user.getName(), tokenRepository.findByUser(user).getToken(), "accountActivation");
    }

    public void sendResetPasswordEmail(User user) throws MessagingException {
        send(user.getEmail(), "Reset hasła GoodsDonation", user.getName(), tokenRepository.findByUser(user).getToken(), "resetPassword");
    }

    private static Properties prop = new Properties();

    private static void fetchConfig() {
        try (InputStream input = new FileInputStream("src/main/resources/mail.properties")) {
            prop.load(input);
        } catch (IOException io) {
            io.printStackTrace();
            System.err.println("Cannot open and load mail.properties file");
        }
    }

//    added mail.properties to be refreshed at runtime:
    private static Properties refreshConfig() {
        prop.clear();
        fetchConfig();
        return prop;
    }

    private void send(String to, String subject, String name, String token, String emailTemplate) throws MessagingException {
        Session session = Session.getDefaultInstance(refreshConfig(),
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(refreshConfig().getProperty("mail.from"), refreshConfig().getProperty("password"));
                    }
                });

            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setContent(generateMailHtml(token, name, to, emailTemplate), "text/html; charset=UTF-8");
            Transport.send(message);
            System.out.println("Email sent successfully");
    }



}
