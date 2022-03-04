package com.oldFoodMan.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.MemberRepository;
import com.oldFoodMan.demo.model.Role;
import com.oldFoodMan.demo.model.RoleRepository;
import com.oldFoodMan.demo.model.UserRole;
import com.oldFoodMan.demo.model.UserRoleId;
import com.oldFoodMan.demo.model.UserRoleRepository;

@Service
public class MemberServiceImpl implements UserDetailsService {

	@Autowired
	MemberRepository memberDao;
	
	@Autowired
	RoleRepository roleDao;
	
	@Autowired
	UserRoleRepository userDao;
	
	@Autowired
	HttpSession hs;
	
	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		
		Optional<Member> option = memberDao.findByName(account);
		
		Member mb = option.get();
		
		hs.setAttribute("member", mb);
		
		if(option.isEmpty()) {
			System.out.println("無此帳號" + account);
			throw new UsernameNotFoundException("帳號: " + account + "不在資料庫");
		}
		
		System.out.println("找到帳號: " + option.get().getAccount());
		
		// [ROLE_USER, ROLE_ADMIN,..]
        List<String> roleNames = roleDao.getRoleNames(option.get().getId());
        System.out.println(roleNames);
        
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        
        if (roleNames != null) {
            for (String role : roleNames) {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority(role);
                grantList.add(authority);
            }
        }
        
        UserDetails userDetails = (UserDetails) new User(option.get().getAccount(), //
                option.get().getMemberPwd(), grantList);
		
		return userDetails;
	}
	
	public void insert(Member member) {

		Role role = roleDao.getById(1);
		
		UserRole user = new UserRole();
		user.setUser_id(member);
		user.setRole_id(role);
		System.out.println(member.getId());
		System.out.println(role.getRole_id());
		
		userDao.save(user);
		
	}
	
	public void update(Member member) {
		
		memberDao.save(member);
		
	}
	
	public Member findById(Integer id) {
		Optional<Member> op = memberDao.findById(id);
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}
		
	public void delete(Integer id) {
		memberDao.deleteById(id);
	}
}
