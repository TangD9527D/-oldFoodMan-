
package com.oldFoodMan.demo.controller.lemon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.lemon.Response;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.lemon.RelationshipService;

@RequestMapping("/manage")
@Controller
public class UserSpaceController {

	@Autowired
	private RelationshipService relationshipService;
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/relationships")
	public String relationships() {
		return "forward:/manage/relationships/follows";
	}
	
	/*
	 * 我的關注列表
	 * @param userId
	 * @param optType
	 * @return
	 */

	@GetMapping("/relationships/follows")
	public ModelAndView follows(
		@RequestParam(value="async",required = false)boolean async,
		@RequestParam(value="page",defaultValue="1",required=false)Integer page,
		@RequestParam(value="size",defaultValue="1",required=false)Integer size,
		Model model,
		HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		String memberAccount = memberData.getAccount();
		User user = userRepository.findByMemberAccount(memberAccount);
		
		Pageable pgb = PageRequest.of(page-1, size, Sort.Direction.ASC, "id");		
		Page<User> userPage = relationshipService.listFollows(user.getId(),pgb);

		List<Integer>friendIds = relationshipService.listFriends(user.getId());
		List<User>userList = userPage.getContent();
		for(int i=0;i<userList.size();i++) {
			if(friendIds.contains(userList.get(i).getId())) {
				userPage.getContent().get(i).setIs_friend(2);
			}
		}
		model.addAttribute("userPage",userPage);
		System.out.println("~~~~~~~~~~~~~~~~~~~我的關注者~~~~~~~");
		model.addAttribute("is_follows",true);
		
		return new ModelAndView(async==true?"#":"#");
	}

	
	/*
	 * 我的粉絲列表
	 * @param userId
	 * @param optType
	 * @return
	 */

	@GetMapping("/relationships/fans")
	public ModelAndView fans(
		@RequestParam(value="async",required=false)boolean async,
		@RequestParam(value="page",defaultValue="1",required=false)Integer page,
		@RequestParam(value="size",defaultValue="1",required=false)Integer size,
		Model model,
		HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		String memberAccount = memberData.getAccount();
		User user = userRepository.findByMemberAccount(memberAccount);
		
		Pageable pgb = PageRequest.of(page-1, size, Sort.Direction.ASC, "id");		
		Page<User> userPage = relationshipService.listFollows(user.getId(),pgb);
		
		List<Integer>friendIds = relationshipService.listFriends(user.getId());
		List<User>userList = userPage.getContent();
		for(int i=0;i<userList.size();i++) {
			if(friendIds.contains(userList.get(i).getId())) {
				userPage.getContent().get(i).setIs_friend(2);
			}
		}
		
		model.addAttribute("userPage",userPage);
		System.out.println("~~~~~~~~~~~~~~~~~~~我的關注者~~~~~~~");
		model.addAttribute("is_fans",true);
		
		return new ModelAndView(async==true?"#":"#");
	}
	
	/*
	 * 添加關係
	 * @param userId
	 * @optType
	 * @return
	 */
	@PostMapping("/relationships")
	public ResponseEntity<Response> followUser(Integer userId,String optType,HttpSession hs){
		Member memberData = (Member)hs.getAttribute("member");
		String memberAccount = memberData.getAccount();
		User user = userRepository.findByMemberAccount(memberAccount);
		//判斷用戶存在
		User temp = userRepository.findById(userId).get();
		if(temp==null) {
			return ResponseEntity.ok().body(new Response(false,"no account"));
		}
		//判斷關注還是取消關注
		//關注
		if("follow".equals(optType)) {
			relationshipService.saveRelationship(new Relationship(user.getId(),userId));
		} else if("notfollow".equals(optType)) {
		//取消關注
			relationshipService.removerRelationship(new Relationship(user.getId(),userId));
		} else {	
		//非法操作
			return ResponseEntity.ok().body(new Response(false,"不可操作"));
		}
		
		Integer fanSize = userRepository.findById(userId).get().getFan_size();
		return ResponseEntity.ok().body(new Response(true,"操作完成",fanSize));
	}
	
}

