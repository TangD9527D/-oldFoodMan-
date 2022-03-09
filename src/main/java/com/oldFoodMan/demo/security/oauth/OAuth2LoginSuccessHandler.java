package com.oldFoodMan.demo.security.oauth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberOAuth2User oAuth2User = (MemberOAuth2User)authentication.getPrincipal();
		
		String email = oAuth2User.getEmail(authentication, oAuth2User);
		
		System.out.println("email: " + email);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	

}
