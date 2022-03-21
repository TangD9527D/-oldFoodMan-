
package com.oldFoodMan.demo.controller.lemon;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.CollectionsRepository;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.ScheduleRepository;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.RelationshipService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;
import com.oldFoodMan.demo.service.lemon.UserService;

@Controller
public class UserSpaceController {

	@Autowired
	private UserService userService;

	@Autowired
	private FoodRecordService foodRecordService;

	@Autowired
	private FoodRecordRepository foodRecordRepository;

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

	@Autowired
	private ScheduleRepository sbDao;

	@Autowired
	private CollectionsRepository collectionRepository;

	/*
	 * 我的關注列表
	 * 
	 * @param userId
	 * 
	 * @param optType
	 * 
	 * @return
	 */

	@GetMapping(value = "/relationships/follows")
	public ModelAndView getFollowsById(ModelAndView mav, HttpSession hs) {

		// Member資料
		Member memberData = (Member) hs.getAttribute("member");
		Integer memberId = memberData.getId();
		// 生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		// 資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		// 照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);

		// 拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);

		// 追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user", user);

		// 去過的店
		Integer count = foodRecordRepository.recordCounts(memberId);
		List<FoodRecord> frds = foodRecordService.memFoodRecords(memberId);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);

		// 小口袋加總
		Integer location = sbDao.findScheduleMember(memberId);
		Integer foodRecord = collectionRepository.colleCounts(memberId);
		Integer totalCollection = location + foodRecord;
		mav.getModel().put("totalCollection", totalCollection);
		System.out.println("這有啥:" + totalCollection);

		// 追蹤的人
		List<Member> list = relationshipService.listFollows(memberId);
		mav.getModel().put("ids", list);

		// 視圖君
		mav.setViewName("/lemon/reviewerFollowing");
		return mav;

	}

	/*
	 * 我的粉絲列表
	 * 
	 * @param userId
	 * 
	 * @param optType
	 * 
	 * @return
	 */

	@GetMapping(value = "/relationships/fans")
	public ModelAndView getFansById(ModelAndView mav, HttpSession hs) {

		// Member資料
		Member memberData = (Member) hs.getAttribute("member");
		Integer memberId = memberData.getId();
		// 生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		// 資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		// 照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);

		// 拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);

		// 追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user", user);
		
		//小口袋加總
		Integer location =sbDao.findScheduleMember(memberId);
		Integer foodRecord =collectionRepository.colleCounts(memberId);				
		Integer totalCollection = location+foodRecord;
		mav.getModel().put("totalCollection", totalCollection);
		System.out.println("這有啥:"+ totalCollection);	
		// 去過的店
		
		Integer count = foodRecordRepository.recordCounts(memberId);
		List<FoodRecord> frds = foodRecordService.memFoodRecords(memberId);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);

		// 追蹤的人
		List<Integer> list = relationshipService.listFans(memberId);

		mav.getModel().put("user", user);
		mav.getModel().put("ids", list);

		// 視圖君
		mav.setViewName("/lemon/reviewerFollower");
		return mav;

	}

	/*
	 * 添加關係
	 * 
	 * @param userId
	 * 
	 * @optType
	 * 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/relationship/follow/{memberId}")
	public int followUser(@PathVariable Integer memberId, HttpSession hs) {
		Member memberData = (Member) hs.getAttribute("member");
		System.out.println(memberData.getId() + "~~~~~~~~~~~~~~~~~~~~~~~~~~~" + memberId);
		Relationship rr = new Relationship();
		rr.setFromUserId(memberData.getId());
		rr.setToUserId(memberId);

		// 關注
		relationshipService.saveRelationship(rr); // 自己對方
		System.out.println("~~~~~~~");
//		Integer fanSize = userRepository.findById(memberId).get().getFan_size();
		System.out.println("~~~~~~~" + "O_O");
		int fanSize = 1;
		return fanSize;
	}

	@ResponseBody
	@PostMapping("/relationship/unfollow/{memberId}")
	public int unfollowUser(@PathVariable Integer memberId, HttpSession hs) {
		Member memberData = (Member) hs.getAttribute("member");
		System.out.println(memberData.getId() + "~~~~~~~~~~~~~~~~~~~~~~~~~~~" + memberId);
		Relationship rr = new Relationship();
		rr.setFromUserId(memberData.getId());
		rr.setToUserId(memberId);
		// 取消關注
		relationshipService.removerRelationship(rr);
		int fanSize = 2;
		return fanSize;
	}

}

/*
 * //1、判断用户是否存在 User temp = userRepository.findById(userId).get(); if (temp ==
 * null) { return ResponseEntity.ok().body(new Response(false, "用户不存在")); }
 * //2、判断是关注还是取消关注 //关注 if ("follow".equals(optType)) {
 * relationshipService.saveRelationship(new Relationship(user.getId(), userId));
 * } else if ("notfollow".equals(optType)) { //取消关注
 * relationshipService.removeRelationship(new Relationship(user.getId(),
 * userId)); } else { //非法操作 return ResponseEntity.ok().body(new Response(false,
 * "非法操作")); } Integer fanSize =
 * userRepository.findById(userId).get().getFanSize(); return
 * ResponseEntity.ok().body(new Response(true, "操作成功",fanSize)); }
 * 
 */
