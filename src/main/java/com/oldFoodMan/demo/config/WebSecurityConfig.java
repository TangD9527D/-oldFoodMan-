package com.oldFoodMan.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.oldFoodMan.demo.service.MemberServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	MemberServiceImpl userDetailsService;

	@Bean // 加鹽(要加密的字串中加特定的字符，打亂原始的字符串)
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	// 根據AuthenticationProvider傳入的自定義添加身份驗證
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

		// Setting Service to find User in the database.
		// And Setting PassswordEncoder
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// 關閉CSRF(跨站請求偽造)攻擊的防護，這樣才不會拒絕外部直接對API 發出的請求，例如Postman 與前端
		http.csrf().disable();
		
		// 不需要登入的頁面
		http.authorizeRequests().antMatchers("/", "/login", "/logout", "/oauth2/**").permitAll();
		
		// 進入(/userInfo) 頁面時需登入，如未登入會重新導向到(/login)登入頁面
		http.authorizeRequests().antMatchers("/ajaxFoodVis", "/productsPage","/shoppingCart","/myOrder","/createData","/MemberRecordList").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

		 http.authorizeRequests()
         .anyRequest().permitAll()
         .and()
         .formLogin()
         	.loginProcessingUrl("/j_spring_security_check")
         	.loginPage("/login")
         	.defaultSuccessUrl("/main")
         	.failureUrl("/login?error=true")
         	.usernameParameter("account")
         	.passwordParameter("password")
         .and()
         .oauth2Login()
		 	.loginPage("/login")
		 	.defaultSuccessUrl("/google")
		 .and()
		 .logout()// Config for Logout Page
		 .permitAll()
		 .logoutSuccessUrl("/");//登出成功時導向頁面

	}

}
