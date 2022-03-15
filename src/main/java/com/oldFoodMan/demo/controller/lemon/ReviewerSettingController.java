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

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.ScheduleBean;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.ScheduleService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;

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
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	

	@GetMapping("/getreviewer/{id}")
	public ModelAndView idMainPage(ModelAndView mav,@PathVariable int id) {
		Member memberBean = memberService.findById(id);
		Date birthday = memberBean.getBirth();
		String bdd = service.getAgeByMember(birthday);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("member", memberBean);
		mav.setViewName("/lemon/idMainPage");
		return mav;
	}
	
	@GetMapping("/follower")
	public String follower(Model model,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		Member memberBean = memberService.findById(memberId);
		List<Member> list = memberService.getAllmember();
		model.addAttribute("bdd", bdd);
		model.addAttribute("members",list);
		model.addAttribute("member",memberBean);
		return "/lemon/reviewerFollower";
	}

	
	@GetMapping("/reviewerAll")
	public String reviewerAll(Model model,HttpSession hs) {
//		Member memberData = (Member)hs.getAttribute("member");
		List<Member> list = memberService.getAllmember();
		model.addAttribute("members",list);
		return "/lemon/reviewerAll";
	}

	//Eddie
	@Autowired
	private ScheduleService sbService ; 


	
	@GetMapping("/reviewerMainPage")
	public ModelAndView reviewerMainPage(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		
		Member memberBean = memberService.findById(memberId);
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/reviewerMainPage");
		return mav;
	}
	
	@GetMapping("/reviewerPageIntro")
	public ModelAndView reviewerPageIntro(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Member memberBean = memberService.findById(memberId);
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
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
	
	@GetMapping("/reviewerIttaomise")
	public String reviewerIttaomise(){
		return "/lemon/reviewerIttaomise";
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
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		
		Member memberBean = memberService.findById(memberId);
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/eddietest");
		return mav;
	}
}