package com.oldFoodMan.demo.model;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;


@Component
public class CouponMailDao {
	
	@Resource
    private JavaMailSender mailSender;
	
	@Value("${spring.mail.username}")
    private String fromEmail;
	
	/**
     * 傳送html郵件
     */
    public void sendHtmlMail(String to, String subject, String content) {
        try {
            //注意這裡使用的是MimeMessage
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(fromEmail);
            helper.setTo(to);
            helper.setSubject(subject);
            //第二個引數：格式是否為html
            helper.setText(content, true);
            mailSender.send(message);
        }catch (MessagingException e){
        	e.printStackTrace();
            System.out.println("傳送郵件時發生異常！");
        }
    }
}
