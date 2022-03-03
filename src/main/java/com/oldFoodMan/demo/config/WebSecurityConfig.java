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
	
	@Bean //加鹽(要加密的字串中加特定的字符，打亂原始的字符串)
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}
	
	
	//根據AuthenticationProvider傳入的自定義添加身份驗證
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		
		// Setting Service to find User in the database.
		// And Setting PassswordEncoder
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
		
	}


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		//If you are only creating a service that is used by non-browser clients, you will likely want to disable CSRF protection.
		http.csrf().disable();
		
		// 不需要登入的頁面
		http.authorizeRequests().antMatchers("/", "/login", "/logout").permitAll();
		
		// 進入(/userInfo) 頁面時需登入，如未登入會重新導向到(/login)登入頁面
		http.authorizeRequests().antMatchers("/userInfo", "/productsPage" , "/productsBackStagePage").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
		
		//同上，但只有指定為ROLE_ADMIN才可以進入
		http.authorizeRequests().antMatchers("/admin").access("hasRole('ROLE_ADMIN')");
		
		//當沒有權限的人要進入有權限人的頁面時，導向的頁面
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		
		//配置登入表單
		http.authorizeRequests().and()
				// Submit URL of login page
				.formLogin()
				.loginProcessingUrl("/j_spring_security_check")
				.loginPage("/login")
				.defaultSuccessUrl("/")//登入成功時所導向的網頁 ("/",true) 強制成功
				.failureUrl("/login?error=true")//登入錯誤時所導向的頁面
				.usernameParameter("account")//
				.passwordParameter("password")
				.and()
				.logout()// Config for Logout Page
				.logoutUrl("/j_spring_security_logout")
				.logoutSuccessUrl("/")//登出成功時導向頁面
				.and()
				// 關閉CSRF(跨站請求偽造)攻擊的防護，這樣才不會拒絕外部直接對API 發出的請求，例如Postman 與前端
		        .csrf().disable();
	}
	
	
}
