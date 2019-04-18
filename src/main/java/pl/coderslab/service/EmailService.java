package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

@Component
public class EmailService {

    @Autowired
    private TemplateEngine templateEngine;

    public String generateMailHtml(String token, String name, String email, String templateFileName)
    {
        Map<String, Object> variables = new HashMap<>();
        variables.put("token", token);
        variables.put("name", name);
        variables.put("email", email);
        String output = this.templateEngine.process(templateFileName, new Context(Locale.getDefault(), variables));

        return output;
    }

    public void send(String to,String subject, String name, String token, String emailTemplate) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        String from = "aaab35404@gmail.com";
        String password = "xxx";

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setContent(generateMailHtml(token, name, to, emailTemplate), "text/html; charset=UTF-8");
            Transport.send(message);
            System.out.println("email sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}
