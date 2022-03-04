package com.oldFoodMan.demo.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@PostMapping("/newMember")
	public ModelAndView newMember(ModelAndView mav, @Valid @ModelAttribute Member member, BindingResult rs) {

		if (!rs.hasErrors()) {
			String memberPwd = member.getMemberPwd();

			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

			member.setMemberPwd(pwd);

			service.insert(member);

			mav.getModel().put("member", member);
		}

		mav.setViewName("welcomePage");

		return mav;
	}

	@GetMapping("/editMember")
	public ModelAndView editMember(ModelAndView mav, @RequestParam(value = "id") Integer id) {

		Member mb = service.findById(id);

		mav.getModel().put("member", mb);
		mav.setViewName("member/editMember");

		return mav;
	}

	@PostMapping("/editMember")
	public ModelAndView viewMember(ModelAndView mav, @Valid @ModelAttribute(name = "member") Member mb) {

		mav.setViewName("member/editMember");

		String memberPwd = mb.getMemberPwd();

		String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

		mb.setMemberPwd(pwd);

		service.update(mb);

		mav.setViewName("redirect:/viewMember");

		return mav;
	}
	
	@GetMapping("/getPicture/{memberId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @RequestParam(value = "id") Integer memberId) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Member mb = service.findById(memberId);
		if (mb != null) {
			Blob blob = mb.getCoverImage();
			filename = mb.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
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
}
