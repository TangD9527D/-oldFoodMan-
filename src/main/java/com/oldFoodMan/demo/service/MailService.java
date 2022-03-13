package com.oldFoodMan.demo.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	private JavaMailSender mailSender;
	 
    @Autowired
    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
 
    public void prepareAndSend(String recipient, Integer id) {
       MimeMessagePreparator messagePreparator = mimeMessage -> {
             MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
             messageHelper.setFrom("tang8797@gmail.com");
             messageHelper.setTo(recipient);
             messageHelper.setSubject("oldFoodMan(老食人)-會員忘記密碼郵件通知信");
             
             String message = "<html><body> <div style=\"border: 2px; border-style: solid;  border-color: black; width: 755px;\">" +
    				 "<div style=\"border: 2px; border-style: solid;  border-color: black; width: 755px;\">" +
    				 "<img src=\"cid:oldimg\" style=\"height: 117px; width: 208px;\"><font size=\"7\">&emsp;oldFoodMan(老食人)</font>" +
    				 "<br>" +
    				 "</div>"
    				 + "<h4>您好:</h4>"
    				 + "<h4>如果不是您申請忘記密碼，請忽略此信件</h4>"
    				 + "<br>\r\n"
    				 + "<h4>若您忘記密碼請點以下連結</h4>"
    				 + "<h4><a href=\"http://localhost:8080/oldFoodMan/resetPassword/"+ id + "\">請點連結</a></h4>"
    				 + "<br>"
    				 + "<h4>祝你使用愉快!!</h4>"
    				 + "<h4>老食人團隊敬上</h4>"
    				 + "</div>";
             
             messageHelper.setText(message,true);

             FileSystemResource file = new FileSystemResource(new File("css/logo.png"));
             messageHelper.addInline("oldimg", file);
             
         };
         try {
             mailSender.send(messagePreparator);
             System.out.println("sent");
             
         } catch (MailException e) {
             System.out.println(e);
         }
    }
}
