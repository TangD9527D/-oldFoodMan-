package com.oldFoodMan.demo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.WebUtils;

@Controller
public class LoginController {
	
	@Autowired
	private MemberServiceImpl service;

	@GetMapping(value = "/login")
    public String loginPage() {	
       return "loginPage";
    }

	@GetMapping(value = "/logout")
    public String logoutSuccessfulPage(HttpServletRequest request, HttpServletResponse response,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
        if (auth != null){      
           new SecurityContextLogoutHandler().logout(request, response, auth);  
        }  
        model.addAttribute("title", "Logout");
        return "redirect:/";
    }

	@GetMapping(value = "/403")
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            User loginedUser = (User) ((Authentication) principal).getPrincipal();

            String userInfo = WebUtils.toString(loginedUser);

            model.addAttribute("userInfo", userInfo);

            String message = "Hi " + principal.getName() 
                    + " You do not have permission to access this page!";
            model.addAttribute("message", message);

        }

        return "403Page";
    }
	
	@GetMapping(value = "/google")
	public ModelAndView user(ModelAndView mav, Principal principal, @AuthenticationPrincipal OAuth2User prinaipal2) {
		
		String email = prinaipal2.getAttribute("email");
		String name = prinaipal2.getAttribute("name");
		
		System.out.println("email: " + email + "    " + "name: " + name);
		
		service.processOAuthPostLogin(name, email);
		
		mav.setViewName("redirect:/main");
		
		return mav;
	} 
	
	@GetMapping(value = "menu/")
	public ModelAndView menu(ModelAndView mav, HttpSession hs) {
		
		Member mb = (Member)hs.getAttribute("member");
		
		mav.getModel().put("member", mb);
		
		mav.setViewName("menu");
		
		return mav;
	}

}
