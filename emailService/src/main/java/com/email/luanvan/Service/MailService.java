package com.email.luanvan.Service;

import com.email.luanvan.Model.MailOrder;
import com.email.luanvan.Model.MailStatus;
import com.email.luanvan.Model.MailStructure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.NumberFormat;
import java.util.Properties;

@Service
public class MailService {
    private static final String CONTENT_TYPE_TEXT_HTML = "text/html;charset=\"utf-8\"";
    @Autowired
    ThymeleafService thymeleafService;
    @Value("${config.mail.host}")
    private String host;
    @Value("${config.mail.port}")
    private String port;
    @Value("${config.mail.username}")
    private String email;
    @Value("${config.mail.password}")
    private String password;
//    public void sendMail(String mail, MailStructure mailStructure){
//        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
//        simpleMailMessage.setFrom(fromEmail);
//        simpleMailMessage.setSubject(mailStructure.getSubject());
//        simpleMailMessage.setText(mailStructure.getMessage());
//        simpleMailMessage.setTo(mail);
//        javaMailSender.send(simpleMailMessage);
//    }

    @KafkaListener(topics = "sendmail", containerFactory = "kafkaListenerContainerFactory")
    public String printProduct(MailOrder mailOrder){
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", port);
        System.out.println(mailOrder);
        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email, password);
                    }
                });
        Message message = new MimeMessage(session);
        try {
            message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(mailOrder.getEmail())});
            System.out.println(thymeleafService.getContent(mailOrder));
            message.setFrom(new InternetAddress(email));
            message.setSubject("Đơn hàng");
            message.setContent(thymeleafService.getContent(mailOrder), CONTENT_TYPE_TEXT_HTML);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        System.out.println(email);
        return mailOrder.getEmail();
    }
    @KafkaListener(topics = "updateStatus", containerFactory = "kafkaListenerContainerFactoryMailStatus")
    public String sendMailUpdateStatus(MailStatus mailStatus){
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", port);
        System.out.println(mailStatus);
        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email, password);
                    }
                });
        Message message = new MimeMessage(session);
        try {
            message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(mailStatus.getEmail())});
            System.out.println(thymeleafService.contentUpdateStatus(mailStatus));
            message.setFrom(new InternetAddress(email));
            message.setSubject("Cập nhật trạng thái đơn hàng");
            message.setContent(thymeleafService.contentUpdateStatus(mailStatus), CONTENT_TYPE_TEXT_HTML);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        System.out.println(email);
        return mailStatus.getEmail();
    }
}
