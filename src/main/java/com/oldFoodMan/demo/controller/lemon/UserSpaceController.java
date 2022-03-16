
package com.oldFoodMan.demo.controller.lemon;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.RelationshipService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;


@Controller
public class UserSpaceController {

	@Autowired
	private RelationshipService relationshipService;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private RelationshipRepository relationshipRepository;
	
	
	/*
	 * 我的關注列表
	 * @param userId
	 * @param optType
	 * @return
	 */

	@GetMapping(value="/relationships/follows")
	public String getFollowsById(Model model,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		int memId = memberData.getId();
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		List<Integer> list = relationshipService.listFollows(memId); 
		
		User user = userRepository.findByMember(memId);
		Member memberBean = memberService.findById(memId);
		ReviewerSetting reviewerBean = rsr.findByMember(memId);
		
		model.addAttribute("user",user);
		model.addAttribute("bdd", bdd);
		model.addAttribute("reviewerPage", reviewerBean);
		model.addAttribute("memberPage", memberBean);
		model.addAttribute("ids",list);
		return "/lemon/reviewerFollowing";
		
	}
	
	
	/*
	 * 我的粉絲列表
	 * @param userId
	 * @param optType
	 * @return
	 */

	@GetMapping(value="/relationships/fans")
	public String getFansById(Model model,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		int memId = memberData.getId();
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		List<Integer> list = relationshipService.listFans(memId);
		Member memberBean = memberService.findById(memId);
		ReviewerSetting reviewerBean = rsr.findByMember(memId);
		
		User user = userRepository.findByMember(memId);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~"+memId);
		Integer follows = relationshipRepository.countByFromUserId(memId);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~"+follows);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memId);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~"+fans);
		user.setFan_size(fans);
		userRepository.save(user);
		
		model.addAttribute("user",user);
		model.addAttribute("bdd", bdd);
		model.addAttribute("reviewerPage", reviewerBean);
		model.addAttribute("memberPage", memberBean);
		model.addAttribute("ids",list);
		return "/lemon/reviewerFollower";
		
	}
	
	
	/*
	 * 添加關係
	 * @param userId
	 * @optType
	 * @return
	 */
	@ResponseBody
	@PostMapping("/relationship/follow/{memberId}")
	public int followUser(@PathVariable Integer memberId,HttpSession hs){
		Member memberData = (Member)hs.getAttribute("member");
		System.out.println(memberData.getId()+"~~~~~~~~~~~~~~~~~~~~~~~~~~~"+memberId);
		Relationship rr = new Relationship();
		rr.setFromUserId(memberData.getId());
		rr.setToUserId(memberId);
		
		//關注
		relationshipService.saveRelationship(rr); //自己對方
		System.out.println("~~~~~~~");
//		Integer fanSize = userRepository.findById(memberId).get().getFan_size();
		System.out.println("~~~~~~~"+"O_O");
		int fanSize= 1;
        return fanSize;
	}
	
	@ResponseBody
	@PostMapping("/relationship/unfollow/{memberId}")
	public int unfollowUser(@PathVariable Integer memberId,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		System.out.println(memberData.getId()+"~~~~~~~~~~~~~~~~~~~~~~~~~~~"+memberId);
		Relationship rr = new Relationship();
		rr.setFromUserId(memberData.getId());
		rr.setToUserId(memberId);
		//取消關注
		relationshipService.removerRelationship(rr);
		int fanSize= 2;
		return fanSize;
	}	

	
	
}

/*
 * //1、判断用户是否存在
        User temp = userRepository.findById(userId).get();
        if (temp == null) {
            return ResponseEntity.ok().body(new Response(false, "用户不存在"));
        }
        //2、判断是关注还是取消关注
        //关注
        if ("follow".equals(optType)) {
            relationshipService.saveRelationship(new Relationship(user.getId(), userId));
        } else if ("notfollow".equals(optType)) {
            //取消关注
            relationshipService.removeRelationship(new Relationship(user.getId(), userId));
        } else {
            //非法操作
            return ResponseEntity.ok().body(new Response(false, "非法操作"));
        }
        Integer fanSize = userRepository.findById(userId).get().getFanSize();
        return ResponseEntity.ok().body(new Response(true, "操作成功",fanSize));
    }

 */

