package com.oldFoodMan.demo.utils;

import java.io.File;

import org.springframework.core.io.FileSystemResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncrytedPasswordUtils {

	// Encryte Password with BCryptPasswordEncoder
	public static String encrytePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}

	public static void main(String[] args) {

		String password = "qwe";

		String encrytedPassword = encrytePassword(password);
		
		String email = "tang8797@gmail.com";
		
		String message1 = "<html><body><a href=\"http://localhost:8080/oldFoodMan/resetPassword/" + 2 + "\">哈哈</a></body></html>";
		
		String message2 = "<html><body> <div style=\"border: 2px; border-style: solid;  border-color: black; width: 755px;\">" +
						 "<div style=\"border: 2px; border-style: solid;  border-color: black; width: 755px;\">" +
						 "<img src=\"${contextRoot}/css\\logo.png\" style=\"height: 117px; width: 208px;\"><font size=\"7\">&emsp;oldFoodMan(老食人)</font>" +
						 "<br>" +
						 "</div>"
						 + "<h4>您好:</h4>"
						 + "<h4>如果不是您申請忘記密碼，請忽略此信件</h4>"
						 + "<br>\r\n"
						 + "<h4>若您忘記密碼請點以下連結</h4>"
						 + "<h4><a href=\"http://localhost:8080/oldFoodMan/resetPassword/7\">請點連結</a></h4>"
						 + "<br>"
						 + "<h4>祝你使用愉快!!</h4>"
						 + "<h4>老食人團隊敬上</h4>"
						 + "</div>";
		
		File file = new File("");
        File pop = new File(file.getAbsolutePath() + "\\src\\main\\webapp\\css\\logo.png");
		
		System.out.println("Encryted Password: " + encrytedPassword);
		System.out.println(pop);
	}

}
