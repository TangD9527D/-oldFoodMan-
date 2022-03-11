
//package com.oldFoodMan.demo.controller.lemon;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.oldFoodMan.demo.model.lemon.User;
//import com.oldFoodMan.demo.model.lemon.UserRepository;
//import com.oldFoodMan.demo.service.lemon.RelationshipService;
//
//@Controller
//public class UserSpaceController {
//
//	@Autowired
//	private RelationshipService relationshipService;
//	
//	@Autowired
//	private UserRepository userRepository;
//	
//	/*
//	 * 我的關注列表
//	 * @param userId
//	 * @param optType
//	 * @return
//	 */

//	@GetMapping("#")
//	public ModelAndView follows(
//		@RequestParam(value="async",required = false)boolean async,
//		@RequestParam(value="page",defaultValue="1",required=false)Integer page,
//		@RequestParam(value="size",defaultValue="1",required=false)Integer size,
//		Model model) {
//		User user = new User();
//		PageRequest pageRequest = new PageRequest(page-1,size);
//		Page<User>userPage=relationshipService.listFollows(user.getId(), pageRequest);
//		
//		List<Integer>friendIds = relationshipService.listFriends(user.getId());
//		List<User>userList = userPage.getContent();
//		for(int i=0;i<userList.size();i++) {
//			if(friendIds.contains(userList.get(i).getId())) {
//				userPage.getContent().get(i).setIsFriend(2);
//			}
//		}
//		model.addAttribute("userPage",userPage);
//		System.out.println("~~~~~~~~~~~~~~~~~~~我的關注者~~~~~~~");
//		model.addAttribute("is_follows",true);
//		
//		return new ModelAndView(async==true?"#":"#");
//	}

//	
//	/*
//	 * 我的粉絲列表
//	 * @param userId
//	 * @param optType
//	 * @return
//	 */

//	@GetMapping("#")
//	public ModelAndView fans(
//		@RequestParam(value="async",required=false)boolean async,
//		@RequestParam(value="page",defaultValue="1",required=false)Integer page,
//		@RequestParam(value="size",defaultValue="1",required=false)Integer size,
//		Model model) {
//		User user = new User();

//		PageRequest pageRequest = new PageRequest(page-1,size,);
//		
//	}
//}

