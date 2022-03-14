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
             MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,true);
             messageHelper.setFrom("tang8797@gmail.com");
             messageHelper.setTo(recipient);
             messageHelper.setSubject("oldFoodMan(老食人)-會員忘記密碼郵件通知信");
             
             String message = "<html><body> <div style=\"border: 2px; border-style: solid;  border-color: black; width: 755px;\">" +
    				 "<div style=\"background-color: #fbf3f3; width: 750px;\">" +
    				 "<img src=\"cid:oldimg\" style=\"height: 117px; width: 208px;\"><font size=\"7\">&emsp;oldFoodMan(老食人)</font>" +
    				 "<br>" +
    				 "</div>"
    				 + "<h2>您好:</h2>"
    				 + "<h2>如果不是您申請忘記密碼，請忽略此信件</h2>"
    				 + "<br>"
    				 + "<h2>若您忘記密碼請點以下連結</h2>"
    				 + "<h2><a href=\"http://localhost:8080/oldFoodMan/resetPassword/"+ id + "\">請點連結</a></h2>"
    				 + "<br>"
    				 + "<h2>祝你使用愉快!!</h2>"
    				 + "<h2>老食人團隊敬上</h2>"
    				 + "</div>";
             
             messageHelper.setText(message,true);
             
             File file = new File("");
             FileSystemResource fileResource = new FileSystemResource(new File(file.getAbsolutePath() + "/src/main/webapp/css/logo.png"));
             messageHelper.addInline("oldimg", fileResource);
             
         };
         try {
             mailSender.send(messagePreparator);
             System.out.println("sent");
             
         } catch (MailException e) {
             System.out.println(e);
         }
    }
}
