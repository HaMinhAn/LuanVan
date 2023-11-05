package com.email.luanvan.Service;

import com.email.luanvan.Model.MailStructure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String fromEmail;
    public void sendMail(String mail, MailStructure mailStructure){
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(fromEmail);
        simpleMailMessage.setSubject(mailStructure.getSubject());
        simpleMailMessage.setText(mailStructure.getMessage());
        simpleMailMessage.setTo(mail);
        javaMailSender.send(simpleMailMessage);
    }

    @KafkaListener(topics = "sendmail", containerFactory = "kafkaListenerContainerFactory")
    public String printProduct(String email){
        String message = "<table>\n" +
                "  <tr>\n" +
                "    <th>Ma don hang</th>\n" +
                "    <th>Tong gia tri</th>\n" +
                "    <th>Tinh trang</th>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td>Alfreds Futterkiste</td>\n" +
                "    <td>Maria Anders</td>\n" +
                "    <td>Germany</td>\n" +
                "  </tr>" +
                "<table/>\n";
        MailStructure mailStructure = MailStructure.builder().subject("Test").message(message).build();
        sendMail(email, mailStructure);
        return email;
    }
}
