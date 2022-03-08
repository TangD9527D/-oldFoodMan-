package com.oldFoodMan.demo.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncrytedPasswordUtils {

	// Encryte Password with BCryptPasswordEncoder
	public static String encrytePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}

	public static void main(String[] args) {
		String password = "don";
		String encrytedPassword = encrytePassword(password);
		
		String email = "tang8797@gmail.com";
		
		String message = "http://localhost:8080/oldFoodMan\reSetPassword?"+ email;

		System.out.println("Encryted Password: " + encrytedPassword);
		System.out.println(message);
	}

}
