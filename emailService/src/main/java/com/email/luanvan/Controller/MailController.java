package com.email.luanvan.Controller;


import com.email.luanvan.Model.MailStructure;
import com.email.luanvan.Service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/mail")
@CrossOrigin
public class MailController {
    @Autowired
    private MailService mailService;
    @PostMapping("/send-mail/{mail}")

    public String sendMail(@PathVariable String mail, @RequestBody MailStructure mailStructure){
        MailStructure mailStructure1 = new MailStructure();
        mailStructure1.setSubject("Xác nhận đặt hàng thành công !");
        String mes = "Đặt hàng thành công\n";
        mes+="Tổng tiền của đơn hàng: "+mailStructure.getTotalPrice();
        mes+="\n Trạng thái đơn hàng là" + mailStructure.getOrderStatus();
        mailStructure1.setMessage(mes);
        mailService.sendMail(mail, mailStructure1);
        return "Mail send successfully";
    }
}
