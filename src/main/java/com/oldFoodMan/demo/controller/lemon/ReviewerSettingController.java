package com.oldFoodMan.demo.controller.lemon;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.MediaType;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.service.MemberServiceImpl;
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
	
	@GetMapping("/reviewerMainPage")
	public ModelAndView reviewerMainPage(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Member memberBean = memberService.findById(memberId);
		
		
		
//		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/reviewerMainPage");
		return mav;
	}
	
	@GetMapping("/reviewerPageIntro")
	public ModelAndView reviewerPageIntro(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Member memberBean = memberService.findById(memberId);
		
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/reviewerPageIntro");
		return mav;
	}
	
	@GetMapping("/setReviewerPage")
	public ModelAndView setReviewerPage(ModelAndView mav) {
		mav.setViewName("/lemon/setReviewerPage");
		ReviewerSetting rvwrs = new ReviewerSetting();
		mav.getModel().put("rvwrSet", rvwrs);
		return mav;
	}
	
	@GetMapping("/reviewerIttaomise")
	public String reviewerIttaomise(){
		return "/lemon/reviewerIttaomise";
	}
	
	@PostMapping(value="/setReviewerPage")
	public ModelAndView postSetting(ModelAndView mav,@ModelAttribute ReviewerSetting rvwrs) {
		
		Integer memberId = service.checkMemberId();
		
//		rsr.deletequeryMemberId(memberId);
	
		Integer queryId = rsr.queryMemberId(memberId);
		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(memberId);
		System.out.println(queryId+"O_O");
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		if(queryId==null) {
			MultipartFile coverImage = rvwrs.getCoverImage();
			String originalFilename = coverImage.getOriginalFilename();
			rvwrs.setReviewer_cover_filename(originalFilename);
			if(coverImage !=null && !coverImage.isEmpty()) {
				try {
					byte[] b = coverImage.getBytes();
					Blob blob = new SerialBlob(b);
					rvwrs.setReviewer_cover(blob);
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException("上傳異常"+e.getMessage());
				}
			}
			
			service.insert(rvwrs);
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String rootDirectory = servletContext.getRealPath("/");
			try {
				File imageFolder = new File(rootDirectory,"imgLemon");
				if(!imageFolder.exists())imageFolder.mkdir();
				File file = new File(imageFolder,rvwrs.getMember()+ext);
				coverImage.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("上傳異常"+e.getMessage());
			}
			
		} else {
			
			
			
			
			rsr.updateTitle(memberId, rvwrs.getReviewer_title());
			rsr.updateSubTitle(memberId, rvwrs.getReviewer_subtitle());
			rsr.updateIntro(memberId, rvwrs.getReviewer_intro());
			rsr.updateCamera(memberId, rvwrs.getReviewer_camera());
			rsr.updateOccupation(memberId, rvwrs.getReviewer_occupation());
//			
//			MultipartFile coverImage = rvwrs.getCoverImage();
//			String originalFilename = coverImage.getOriginalFilename();
//			rvwrs.setReviewer_cover_filename(originalFilename);
//			
//			if(coverImage !=null && !coverImage.isEmpty()) {
//				try {
//					byte[] b = coverImage.getBytes();
//					Blob blob = new SerialBlob(b);
//					rvwrs.setReviewer_cover(blob);
//					System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~");
//					System.out.println(rvwrs.getReviewer_cover().getBinaryStream());
//					System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~");
//				} catch(Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("上傳異常"+e.getMessage());
//				}
//			}
//			
//			rsr.updateReviewer_cover(memberId, rvwrs.getReviewer_cover());
//			
//			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			String rootDirectory = servletContext.getRealPath("/");
//			try {
//				File imageFolder = new File(rootDirectory,"imgLemon");
//				if(!imageFolder.exists())imageFolder.mkdir();
//				File file = new File(imageFolder,rvwrs.getMember()+ext);
//				coverImage.transferTo(file);
//			} catch(Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("上傳異常"+e.getMessage());
//			}
		}

		mav.setViewName("redirect:/reviewerMainPage/");
		return mav;
	}
	
	
	@GetMapping("/getPictureLemon/{memberId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer memberId){
		String filePath = "/imgLemon/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename="";
		Integer len = 0;
		ReviewerSetting rvwrs = rsr.findByMember(memberId);
		if(rvwrs!=null) {
			Blob blob = rvwrs.getReviewer_cover();
			filename = rvwrs.getReviewer_cover_filename();
			if(blob!=null) {
				try {
					len = (int)blob.length();
					media = blob.getBytes(1, len);
				} catch(SQLException e) {
					throw new RuntimeException("ReviewerConroller / getpicture出問題"+e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
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
	
}