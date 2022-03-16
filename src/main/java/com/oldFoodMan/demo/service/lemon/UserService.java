package com.oldFoodMan.demo.service.lemon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User findByMember(Integer memId){
		User user = userRepository.findByMember(memId);
		if(user!=null) {
			return user;
		} else {
			userRepository.insertByMember(memId);
			User usera =  userRepository.findByMember(memId);
			return usera;
		}
	}

}
