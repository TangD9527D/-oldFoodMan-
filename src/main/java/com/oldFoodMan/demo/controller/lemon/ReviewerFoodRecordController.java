package com.oldFoodMan.demo.controller.lemon;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.ReviewerFoodRecordService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;
import com.oldFoodMan.demo.service.lemon.UserService;

@Controller
public class ReviewerFoodRecordController {

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RelationshipRepository relationshipRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewerFoodRecordService rfrService;
	
	@Autowired
	private FoodRecordService foodRecordService;
	
	@Autowired
	private FoodRecordRepository foodRecordRepository;
	
	@Autowired
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@GetMapping("/reviewerIttaomise")
	public ModelAndView reviewerIttaomise(ModelAndView mav,HttpSession hs) {
		
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		
		//拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);
		
		//追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user",user);
		
		
		//去過的店
		Integer count = foodRecordRepository.recordCounts(memberId);
		List<FoodRecord> frds = foodRecordService.memFoodRecords(memberId);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);
		
		//視圖君
		mav.setViewName("/lemon/reviewerIttaomise");
		
		return mav;
	}
	
	@GetMapping("/reviewerKoromi")
	public ModelAndView reviewerKoromi(ModelAndView mav,HttpSession hs) {
		
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		
		//拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);
		
		//追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user",user);
		
		//喜愛的店
		Integer count = foodRecordRepository.recordFavCounts(memberId);
		List<FoodRecord> frds = foodRecordRepository.recordFavorite(memberId);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);
		
		//視圖君
		mav.setViewName("/lemon/reviewerKoromi");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/ittaomise/savingTop/{memberId}")
	public int followUser(@PathVariable Integer memberId,ModelAndView mav,HttpSession hs){
		ReviewerSaveRating rsrating = rfrService.checkRsr(memberId);
		rfrService.saveRatingg(memberId, rsrating);
		int fanSize= 1;
        return fanSize;

	}
	
	@ResponseBody
	@PostMapping("/ittaomise/unsavingTop/{memberId}")
	public int unfollowUser(@PathVariable Integer memberId,ModelAndView mav,HttpSession hs){
		rfrService.deleteRatingg(memberId);
		int fanSize= 1;
        return fanSize;

	}
	
	
	@PostMapping("/ittaomise/search/city")
	public ModelAndView articleCitySearch(@RequestParam(value="Area")Integer cityValue,ModelAndView mav,HttpSession hs) {
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
				
		//拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);
				
		//追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user",user);
		
		//城市搜尋+數量
		List<FoodRecord> frds = rfrService.citySortRecord(memberId,cityValue);
		String cityName = rfrService.cityValueName(cityValue);
		Integer cityCount = rfrService.cityCount(memberId, cityValue);
		mav.getModel().put("count", cityCount);
		mav.getModel().put("cityName", cityName);
		mav.getModel().put("frds", frds);
		
		
		
		mav.setViewName("/lemon/reviewerIttaomiseCity");
		return mav;
		
	}
	
	@PostMapping("/ittaomise/search/type")
	public ModelAndView articleTypeSearch(@RequestParam(value="Genre")Integer typeValue,ModelAndView mav,HttpSession hs) {
		//Member資料
				Member memberData = (Member)hs.getAttribute("member");
				Integer memberId = memberData.getId();
				
		//生日
				Date birthday = memberData.getBirth();
				String bdd = service.getAgeByMember(birthday);
		//資料欄
				ReviewerSetting reviewerBean = rsr.findByMember(memberId);
				Member memberBean = memberService.findById(memberId);
		//照片
				Integer picCounts = foodRecordRepository.picCounts(memberId);
				mav.getModel().put("picCounts", picCounts);
				mav.getModel().put("bdd", bdd);
				mav.getModel().put("reviewerPage", reviewerBean);
				mav.getModel().put("memberPage", memberBean);
						
		//拜訪店家 喜愛店家
				Integer countAll = foodRecordRepository.recordCounts(memberId);
				Integer countFav = foodRecordRepository.recordFavCounts(memberId);
				mav.getModel().put("countFav", countFav);
				mav.getModel().put("countAll", countAll);
						
		//追蹤 粉絲
				User user = userService.findByMember(memberId);
				Integer follows = relationshipRepository.countByFromUserId(memberId);
				user.setFollow_size(follows);
				Integer fans = relationshipRepository.countByToUserId(memberId);
				user.setFan_size(fans);
				userRepository.save(user);
				mav.getModel().put("user",user);
		
		//種類搜尋+數量
				List<FoodRecord> frds = rfrService.typeSortRecord(memberId,typeValue);
				String typeName = rfrService.typeValueName(typeValue);
				Integer typeCount = rfrService.typeCount(memberId, typeValue);
				mav.getModel().put("count", typeCount);
				mav.getModel().put("typeName", typeName);
				mav.getModel().put("frds", frds);
				
		mav.setViewName("/lemon/reviewerIttaomiseType");
		return mav;
	}
	
	@PostMapping("/ittaomise/search/price")
	public ModelAndView articlePriceSearch(@RequestParam(value="lowPrice")Integer lowPrice,
											@RequestParam(value="highPrice")Integer highPrice,
											ModelAndView mav,HttpSession hs) {
		
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
				
		//拜訪店家 喜愛店家
		Integer countAll = foodRecordRepository.recordCounts(memberId);
		Integer countFav = foodRecordRepository.recordFavCounts(memberId);
		mav.getModel().put("countFav", countFav);
		mav.getModel().put("countAll", countAll);
				
		//追蹤 粉絲
		User user = userService.findByMember(memberId);
		Integer follows = relationshipRepository.countByFromUserId(memberId);
		user.setFollow_size(follows);
		Integer fans = relationshipRepository.countByToUserId(memberId);
		user.setFan_size(fans);
		userRepository.save(user);
		mav.getModel().put("user",user);
		
		//種類搜尋+數量
		List<FoodRecord> frds = rfrService.priceSortRecord(memberId,lowPrice,highPrice);
		String priceName = rfrService.priceValueName(lowPrice,highPrice);
		Integer priceCount = rfrService.priceCount(memberId, lowPrice,highPrice);
		mav.getModel().put("count", priceCount);
		mav.getModel().put("typeName", priceName);
		mav.getModel().put("frds", frds);
		
		mav.setViewName("/lemon/reviewerIttaomisePrice");
		return mav;
	}
}
