package com.oldFoodMan.demo.controller;

import java.awt.Image;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.service.OldFoodManServiceTest;

@Controller
public class PageController_02 {

	@Autowired
	private OldFoodManServiceTest service;
	ServletContext servletContext;
	
	
	public PageController_02(ServletContext servletContext) {
		super();
		this.servletContext = servletContext;
	}

//	@GetMapping("searchMaps")
//	public String map11() {
//
//		return "maps";
//	}

	@GetMapping("/ajaxMessages")
	public ModelAndView ajaxPage(ModelAndView mav) {

		mav.setViewName("messages/ajaxMessages");

		return mav;
	}

	@ResponseBody
	@GetMapping("api/searchMaps1")
	public List<FoodRecord> mapsAjax(ModelAndView mav) {

		List<FoodRecord> list = service.findAll();

		return list;

	}

	
	@GetMapping("searchMaps")
	public ModelAndView mapsAjaxPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		mav.setViewName("maps");

		Page<FoodRecord> page = service.findByPage(pageNumber);

		mav.getModel().put("page", page);

		return mav;

	}

	@ResponseBody
	@GetMapping("api/searchMaps2")
	public List<FoodRecord> mapsAjaxPage2(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<FoodRecord> page = service.findByPage(pageNumber);
		List<FoodRecord> list = page.getContent();

		mav.getModel().put("page", page);

		return list;

	}
	
	@GetMapping("/getPicture1/{id}")
	public ResponseEntity<byte[]> getPicture1(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/images/snow.png"; 
       

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		FoodRecord bean = service.findById(id);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getUploadPicture();
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
