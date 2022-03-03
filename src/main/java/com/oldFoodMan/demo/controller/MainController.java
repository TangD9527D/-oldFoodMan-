package com.oldFoodMan.demo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.utils.WebUtils;

@Controller
public class MainController {

	@GetMapping(value = "/admin")
    public String adminPage(Model model, Principal principal,HttpSession hs) {
        
        User loginedUser = (User)((Authentication) principal).getPrincipal();
        
        String userInfo = WebUtils.toString(loginedUser);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("title", "admin");
        
         Member member = (Member)hs.getAttribute("member");
         
         System.out.println("拿到httpSession!!" + member.getId());
         
         
        return "adminPage";
    }

	@GetMapping(value = "/login")
    public String loginPage(Model model) {
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

	@GetMapping(value = "/userInfo")
    public String userInfo(Model model, Principal principal) {

        String userName = principal.getName();

        System.out.println("User Name: " + userName);

        User loginedUser = (User) ((Authentication) principal).getPrincipal();

        String userInfo = WebUtils.toString(loginedUser);
        model.addAttribute("userInfo", userInfo);

        return "userInfoPage";
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

}
