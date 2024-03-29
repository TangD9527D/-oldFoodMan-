package com.oldFoodMan.demo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl service;
	
	@Autowired
	ServletContext servletContext;

	@ResponseBody
	@PostMapping("/newMember")
	public void newMember(@RequestBody Member mb) {

			String memberPwd = mb.getMemberPwd();

			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

			mb.setMemberPwd(pwd);

			service.insert(mb);
	}

	@PostMapping("/editMember")
	public ModelAndView editMember(ModelAndView mav, @Valid @ModelAttribute(name = "member") Member mb) {

		mav.setViewName("member/editMember");
		
		MultipartFile productImage = mb.getMemberImage();
		String originalFilename = productImage.getOriginalFilename();
		mb.setFileNames(originalFilename);
		
		service.update(mb);
		
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "imgDon");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder, mb.getId() + ext);
			productImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}

		mav.setViewName("redirect:/reviewerMainPage");

		return mav;
	}
	
	@GetMapping("/getPhoto/{memberId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer memberId) {
		String filePath = "imgDon/noPhoto.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		Member mb = service.findById(memberId);
		String originalFilename = mb.getFileNames();
		if (originalFilename != null) {
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			filePath = "imgDon/" + memberId + ext;
			media = toByteArray(filePath);
			filename = filePath;
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = servletContext.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = servletContext.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	@GetMapping("/backStage/account")
	public ModelAndView findAllAccount(ModelAndView mav) {
		
		mav.setViewName("backStage/account");
		
		List<Member> member = service.getAllmember();
		
		mav.getModel().put("mb", member);
		
		return mav;
		
	}

}
