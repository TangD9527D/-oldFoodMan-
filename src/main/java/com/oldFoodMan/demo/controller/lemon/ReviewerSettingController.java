package com.oldFoodMan.demo.controller.lemon;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Collections;
import com.oldFoodMan.demo.model.CollectionsRepository;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.ScheduleBean;
import com.oldFoodMan.demo.model.ScheduleRepository;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.CollectionsService;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.ScheduleService;
import com.oldFoodMan.demo.service.lemon.ReviewerFoodRecordService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;
import com.oldFoodMan.demo.service.lemon.UserService;

@Controller
public class ReviewerSettingController {
	
	ReviewerSettingService reviewerService;
	ServletContext servletContext;
	
	@Autowired
	public ReviewerSettingController(ReviewerSettingService reviewerService, ServletContext servletContext) {
		this.reviewerService = reviewerService;
		this.servletContext = servletContext;
	}
	
	@Autowired
	private CollectionsRepository collectionRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewerFoodRecordService reviewerFoodRecordService;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RelationshipRepository relationshipRepository;
	
	@Autowired
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	FoodRecordService foodRecordService;
	
	@Autowired
	FoodRecordRepository foodRecordRepository;
	
	//Eddie
	@Autowired
	private ScheduleService sbService ; 
	@Autowired
	private CollectionsService cService ;
	@Autowired
	private ScheduleRepository sbDao;
	

	@GetMapping("/getreviewer/{id}")
	public ModelAndView idMainPage(ModelAndView mav,@PathVariable int id) {
		//Member資料
				Member memberData = memberService.findById(id);
				Integer memberId = id;
				System.out.println("~~~~~~~~~~~"+memberId);
				//生日
				Date birthday = memberData.getBirth();
				String bdd = service.getAgeByMember(birthday);
				mav.getModel().put("bdd", bdd);
				//資料欄
				ReviewerSetting reviewerBean = rsr.findByMember(memberId);
				Member memberBean = memberService.findById(memberId);
				mav.getModel().put("reviewerPage", reviewerBean);
				mav.getModel().put("memberPage", memberBean);
				//照片
				Integer picCounts = foodRecordRepository.picCounts(memberId);
				mav.getModel().put("picCounts", picCounts);
				//收藏
				Integer colleCounts = collectionRepository.colleCounts(memberId);
				mav.getModel().put("colleCounts",colleCounts);
				
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
				
				//標記區域
				List<ReviewerSaveRating> rsrs = reviewerFoodRecordService.findByMember(memberId);
				mav.getModel().put("rsrs",rsrs);
				
				//拜訪區域
				//taipei
				Integer taipei = foodRecordRepository.countcity1(memberId);
				Integer newtaipei = foodRecordRepository.countcity2(memberId);
				Integer taoyuan = foodRecordRepository.countcity3(memberId);
				Integer taichung = foodRecordRepository.countcity4(memberId);
				Integer tainan = foodRecordRepository.countcity5(memberId);
				Integer kaohsiung = foodRecordRepository.countcity6(memberId);
				Integer yilan = foodRecordRepository.countcity7(memberId);
				Integer hsinchu = foodRecordRepository.countcity8(memberId);
				Integer miaoli = foodRecordRepository.countcity9(memberId);
				Integer changhua = foodRecordRepository.countcity10(memberId);
				Integer nantou = foodRecordRepository.countcity11(memberId);
				Integer yunlin = foodRecordRepository.countcity12(memberId);
				Integer jiayi = foodRecordRepository.countcity13(memberId);
				Integer pingtong = foodRecordRepository.countcity14(memberId);
				Integer hualian = foodRecordRepository.countcity15(memberId);
				Integer taitong = foodRecordRepository.countcity16(memberId);
				Integer penghu = foodRecordRepository.countcity17(memberId);
				Integer keelongcity = foodRecordRepository.countcity18(memberId);
				Integer hsinchucity = foodRecordRepository.countcity19(memberId);
				Integer jiayicity = foodRecordRepository.countcity20(memberId);
				mav.getModel().put("taipei", taipei);
				mav.getModel().put("newtaipei", newtaipei);
				mav.getModel().put("taoyuan", taoyuan);
				mav.getModel().put("taichung", taichung);
				mav.getModel().put("tainan", tainan);
				mav.getModel().put("kaohsiung", kaohsiung);
				mav.getModel().put("yilan", yilan);
				mav.getModel().put("hsinchu", hsinchu);
				mav.getModel().put("miaoli", miaoli);
				mav.getModel().put("changhua", changhua);
				mav.getModel().put("nantou", nantou);
				mav.getModel().put("yunlin", yunlin);
				mav.getModel().put("jiayi", jiayi);
				mav.getModel().put("pingtong", pingtong);
				mav.getModel().put("hualian", hualian);
				mav.getModel().put("taitong", taitong);
				mav.getModel().put("penghu", penghu);
				mav.getModel().put("keelongcity", keelongcity);
				mav.getModel().put("hsinchucity", hsinchucity);
				mav.getModel().put("jiayicity", jiayicity);
		
		//視圖君
		mav.setViewName("/lemon/idMainPage");
		return mav;
	}
	
	@GetMapping("/reviewerAll")
	public String reviewerAll(Model model,HttpSession hs) {
		List<Member> list = memberService.getAllmember();
		model.addAttribute("members",list);
		return "/lemon/reviewerAll";
	}


	@GetMapping("/reviewerMainPage")
	public ModelAndView reviewerMainPage(ModelAndView mav,HttpSession hs) {
		
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		mav.getModel().put("bdd", bdd);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		//收藏
		Integer colleCounts = collectionRepository.colleCounts(memberId);
		mav.getModel().put("colleCounts",colleCounts);
		
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
		
		//小口袋加總
		Integer location =sbDao.findScheduleMember(memberId);
		Integer foodRecord =collectionRepository.colleCounts(memberId);				
		Integer totalCollection = location+foodRecord;
		mav.getModel().put("totalCollection", totalCollection);
		System.out.println("這有啥:"+ totalCollection);
		
		
		//標記區域
		List<ReviewerSaveRating> rsrs = reviewerFoodRecordService.findAll();
		mav.getModel().put("rsrs",rsrs);
		
		//拜訪區域
		//taipei
		Integer taipei = foodRecordRepository.countcity1(memberId);
		Integer newtaipei = foodRecordRepository.countcity2(memberId);
		Integer taoyuan = foodRecordRepository.countcity3(memberId);
		Integer taichung = foodRecordRepository.countcity4(memberId);
		Integer tainan = foodRecordRepository.countcity5(memberId);
		Integer kaohsiung = foodRecordRepository.countcity6(memberId);
		Integer yilan = foodRecordRepository.countcity7(memberId);
		Integer hsinchu = foodRecordRepository.countcity8(memberId);
		Integer miaoli = foodRecordRepository.countcity9(memberId);
		Integer changhua = foodRecordRepository.countcity10(memberId);
		Integer nantou = foodRecordRepository.countcity11(memberId);
		Integer yunlin = foodRecordRepository.countcity12(memberId);
		Integer jiayi = foodRecordRepository.countcity13(memberId);
		Integer pingtong = foodRecordRepository.countcity14(memberId);
		Integer hualian = foodRecordRepository.countcity15(memberId);
		Integer taitong = foodRecordRepository.countcity16(memberId);
		Integer penghu = foodRecordRepository.countcity17(memberId);
		Integer keelongcity = foodRecordRepository.countcity18(memberId);
		Integer hsinchucity = foodRecordRepository.countcity19(memberId);
		Integer jiayicity = foodRecordRepository.countcity20(memberId);
		mav.getModel().put("taipei", taipei);
		mav.getModel().put("newtaipei", newtaipei);
		mav.getModel().put("taoyuan", taoyuan);
		mav.getModel().put("taichung", taichung);
		mav.getModel().put("tainan", tainan);
		mav.getModel().put("kaohsiung", kaohsiung);
		mav.getModel().put("yilan", yilan);
		mav.getModel().put("hsinchu", hsinchu);
		mav.getModel().put("miaoli", miaoli);
		mav.getModel().put("changhua", changhua);
		mav.getModel().put("nantou", nantou);
		mav.getModel().put("yunlin", yunlin);
		mav.getModel().put("jiayi", jiayi);
		mav.getModel().put("pingtong", pingtong);
		mav.getModel().put("hualian", hualian);
		mav.getModel().put("taitong", taitong);
		mav.getModel().put("penghu", penghu);
		mav.getModel().put("keelongcity", keelongcity);
		mav.getModel().put("hsinchucity", hsinchucity);
		mav.getModel().put("jiayicity", jiayicity);
		
		//視圖君
		mav.setViewName("/lemon/reviewerMainPage");
		return mav;
	}
	
	@GetMapping("/reviewerPageIntro")
	public ModelAndView reviewerPageIntro(ModelAndView mav,HttpSession hs) {
		
		//Member資料
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		//生日
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		mav.getModel().put("bdd", bdd);
		//資料欄
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		//照片
		Integer picCounts = foodRecordRepository.picCounts(memberId);
		mav.getModel().put("picCounts", picCounts);
		//收藏
		Integer colleCounts = collectionRepository.colleCounts(memberId);
		mav.getModel().put("colleCounts",colleCounts);
				
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
		
		//starcounts
		Integer kstar5 = reviewerFoodRecordService.countStr5(memberId);
		Integer kstar4 = reviewerFoodRecordService.countStr4(memberId);
		Integer kstar3 = reviewerFoodRecordService.countStr3(memberId);
		Integer kstar2 = reviewerFoodRecordService.countStr2(memberId);
		Integer kstar1 = reviewerFoodRecordService.countStr1(memberId);
		
		Float ksum = (float) (kstar5+kstar4+kstar3+kstar2+kstar1);
		Integer kstar5Avg = Math.round(kstar5/ksum*100);
		Integer kstar4Avg = Math.round(kstar4/ksum*100);
		Integer kstar3Avg = Math.round(kstar3/ksum*100);
		Integer kstar2Avg = Math.round(kstar2/ksum*100);
		Integer kstar1Avg = Math.round(kstar1/ksum*100);
		
		mav.getModel().put("k5", kstar5);
		mav.getModel().put("k4", kstar4);
		mav.getModel().put("k3", kstar3);
		mav.getModel().put("k2", kstar2);
		mav.getModel().put("k1", kstar1);
		mav.getModel().put("k5Avg", kstar5Avg);
		mav.getModel().put("k4Avg", kstar4Avg);
		mav.getModel().put("k3Avg", kstar3Avg);
		mav.getModel().put("k2Avg", kstar2Avg);
		mav.getModel().put("k1Avg", kstar1Avg);
		
		//consume price
		Integer kprice1 = reviewerFoodRecordService.countPrice1(memberId);
		Integer kprice2 = reviewerFoodRecordService.countPrice2(memberId);
		Integer kprice3 = reviewerFoodRecordService.countPrice3(memberId);
		Integer kprice4 = reviewerFoodRecordService.countPrice4(memberId);
		
		Float kpsum = (float) (kprice4+kprice3+kprice2+kprice1);
		Integer kprice1Avg = Math.round(kprice1/kpsum*100);
		Integer kprice2Avg = Math.round(kprice2/kpsum*100);
		Integer kprice3Avg = Math.round(kprice3/kpsum*100);
		Integer kprice4Avg = Math.round(kprice4/kpsum*100);
		mav.getModel().put("kp1", kprice1);
		mav.getModel().put("kp2", kprice2);
		mav.getModel().put("kp3", kprice3);
		mav.getModel().put("kp4", kprice4);
		mav.getModel().put("kp1Avg", kprice1Avg);
		mav.getModel().put("kp2Avg", kprice2Avg);
		mav.getModel().put("kp3Avg", kprice3Avg);
		mav.getModel().put("kp4Avg", kprice4Avg);
		
		//視圖君
		mav.setViewName("/lemon/reviewerPageIntro");
		return mav;
	}
	
	@GetMapping("/setReviewerPage")
	public ModelAndView setReviewerPage(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();

		mav.setViewName("/lemon/setReviewerPage");
		ReviewerSetting rvwrs = new ReviewerSetting();
		ReviewerSetting preview = new ReviewerSetting();
		preview = rsr.findByMember(memberId);
		
		Member mb = memberService.findById(memberId);
		
		mav.getModel().put("member", mb);
		mav.getModel().put("rvwrSet", rvwrs);
		mav.getModel().put("preview", preview);
		
		rsr.deletequeryMemberId(memberId);
		
		System.out.println("171777771717771717117" + mb.getMemberName());
		
		return mav;
	}
	
	@PostMapping(value="/setReviewerPage")
	public ModelAndView postSetting(ModelAndView mav,@ModelAttribute ReviewerSetting rvwrs) {
		
		Integer memberId = service.checkMemberId();
		Integer queryId = rsr.queryMemberId(memberId);
		
		if(queryId==null) {
			MultipartFile coverImage = rvwrs.getCoverImage();
			String originalFilename = coverImage.getOriginalFilename();
			rvwrs.setReviewer_cover_filename(originalFilename);
				
			service.insert(rvwrs);
			
//			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String rootDirectory = servletContext.getRealPath("/");
			try {
				File imageFolder = new File(rootDirectory,"imgLemon");
				if(!imageFolder.exists())imageFolder.mkdir();
				File file = new File(imageFolder,originalFilename);
				coverImage.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("上傳異常"+e.getMessage());
			}
			
		} else {
			
//			rsr.updateTitle(memberId, rvwrs.getReviewer_title());
//			rsr.updateSubTitle(memberId, rvwrs.getReviewer_subtitle());
//			rsr.updateIntro(memberId, rvwrs.getReviewer_intro());
//			rsr.updateCamera(memberId, rvwrs.getReviewer_camera());
//			rsr.updateOccupation(memberId, rvwrs.getReviewer_occupation());
			rsr.updateReviewer_filename(memberId, rvwrs.getReviewer_cover_filename());
		}

		mav.setViewName("redirect:/reviewerMainPage/");
		return mav;
	}
	
	
	@GetMapping("/getPictureLemon/{memberId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer memberId){
		String filePath = "imgLemon/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename="";
//		Integer len = 0;
		String cover_filename = rsr.fileNamequeryMemberId(memberId);
		
//		System.out.println("~~~~~~~~~~~~file name~~~~~~~~"+cover_filename);
//		System.out.println("~~~~~~~~~~~~file path~~~~~~~~"+filePath);
		
		if(cover_filename != null) {
			filePath = "imgLemon/"+cover_filename;
			media = toByteArray(filePath);
			filename = filePath;
//			System.out.println("~~~~~~~~~~~~if true file name~~~~~~~~"+filename);
//			System.out.println("~~~~~~~~~~~~if true file path~~~~~~~~"+filePath);	
		} else {
			media = toByteArray(filePath);
			filename = filePath;
//			System.out.println("~~~~~~~~~~~~if false file name~~~~~~~~"+filename);
//			System.out.println("~~~~~~~~~~~~if false file path~~~~~~~~"+filePath);
		}
		
//		if(rvwrs!=null) {
//			Blob blob = rvwrs.getReviewer_cover();
//			filename = rvwrs.getReviewer_cover_filename();
//			if(blob!=null) {
//				try {
//					len = (int)blob.length();
//					media = blob.getBytes(1, len);
//				} catch(SQLException e) {
//					throw new RuntimeException("ReviewerConroller / getpicture出問題"+e.getMessage());
//				}
//			} else {
//				media = toByteArray(filePath);
//				filename = filePath;
//			}
//		} else {
//			media = toByteArray(filePath);
//			filename = filePath;
//		}
	
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			String mimeType = servletContext.getMimeType(filename);
			MediaType mediaType = MediaType.valueOf(mimeType);
			System.out.println("mediaType"+mediaType);
			headers.setContentType(mediaType);
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media,headers,HttpStatus.OK);
			return responseEntity;		
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = servletContext.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b);
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
//	Eddie
	
	@ResponseBody
	@GetMapping("/likeloctest")
	public List<ScheduleBean> mapsAjax(ModelAndView mav,@RequestParam(value="member_id")Integer id,HttpSession hs ) {

		Member mid = (Member)hs.getAttribute("member");
		Integer idd=mid.getId();
		System.out.println("當下的: "+id);
		List<ScheduleBean> list = sbService.findByIdlike(id);

		return list;

	}
	
	
	@GetMapping("/eddietest")
	public ModelAndView reviewerMainPage11(ModelAndView mav,HttpSession hs) {
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
				
				//標記區域
				List<ReviewerSaveRating> rsrs = reviewerFoodRecordService.findAll();
				mav.getModel().put("rsrs",rsrs);
				
				//小口袋加總
				Integer location =sbDao.findScheduleMember(memberId);
				Integer foodRecord =collectionRepository.colleCounts(memberId);				
				Integer totalCollection = location+foodRecord;
				mav.getModel().put("totalCollection", totalCollection);
				System.out.println("這有啥:"+ totalCollection);
				
				
				//拜訪區域
				//taipei
				Integer taipei = foodRecordRepository.countcity1(memberId);
				mav.getModel().put("taipei", taipei);
				mav.setViewName("/lemon/eddietest");
				
			
				
				
				return mav;
	}
	
	@ResponseBody
	@GetMapping(value="/findCollections11")  //查全部收藏的文章
	public List<Collections> likeCollections(ModelAndView mav,HttpSession hs) {
		
		Member mid = (Member)hs.getAttribute("member");
		Integer id=mid.getId();
		System.out.println("mid:::"+mid);

		
		System.out.println("id:"+id);
		
		List<Collections> list=cService.findClotById(mid);
		
		System.out.println(" ˋ_ˊ "+list);
		mav.getModel().put("likeCollections", list);			
		mav.setViewName("viewById");
		return list ;		
		
	}
	
	
	
	
}