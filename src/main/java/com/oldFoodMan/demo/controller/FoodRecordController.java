package com.oldFoodMan.demo.controller;

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
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.FoodRecordService;

import org.springframework.util.StringUtils;



@Controller
public class FoodRecordController {

	@Autowired
	private FoodRecordService service;
	

	
	@Autowired
	ServletContext servletContext;

	//新增資料(可以新增，但無法存圖片，因此這裡不使用)
//	@PostMapping(value = "/createData")
//	public ModelAndView postNewData(ModelAndView mav, @Valid @ModelAttribute(name = "foodRecord") FoodRecord fr,BindingResult rs) {
//		service.insertRF(fr);
//		mav.setViewName("redirect:/theLastestRecord");   //回傳到PageController的record/totalRecord的頁面
//		return mav;
//	}
	
	
	//負責讀取與傳送圖片資料
	@GetMapping("/getPicture/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) { //@PathVariable Integer id使用變數方法將id傳送進來
	    String filePath = "/images/NoImage.jpg";  //沒有圖片的時候顯示一張的照片

	    byte[] media = null;   //回應的本體是null
	    HttpHeaders headers = new HttpHeaders();   //將位元組陣列包放進media內
	    String filename = "";
	    int len = 0;
	    FoodRecord record = service.findById(id);
	    if (record != null) { //如果record有資料
	    	Blob blob = record.getCoverImage();    //就將圖片(CoverImage)放在表格的Blob欄位內
	    	filename = record.getUploadPicture();
	    	if(blob != null) {   //如果Blob欄位有圖片
 	    		try {
	    			len = (int)blob.length();  //取出圖片的長度
	    			media = blob.getBytes(1, len);  
	    			//getBytes() 是Java程式語言中將一個字元串轉化為一個位元組數組byte[]的方法。
	    			//存儲字元數據時（字元串就是字元數據），會先進行查表，然後將查詢的結果寫入設備，
	    			//讀取時也是先查表，把查到的內容列印到顯示設備上
	    			
	    		} catch (SQLException e) {  
	    			throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
	    		}
	    	 }else {
		            media = toByteArray(filePath);
		            filename = filePath;
	    	 } 
	      }else {
		        media = toByteArray(filePath);
		        filename = filePath;
		  }
	    headers.setCacheControl(CacheControl.noCache().getHeaderValue()); //因為圖片是動態的，所以圖片不要放到快取區
	    String mimeType = servletContext.getMimeType(filename);
	    MediaType mediaType = MediaType.valueOf(mimeType);
	    System.out.println("mediaType =" + mediaType);  //印出檔案格式
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
	
	//允許上傳的欄位
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields(
				"productImage", 
				"title", 
				"content", 
				"shopName", 
				"shopType", 
				"audience", 
				"priceScope",
				"city",
				"town",
				"shopAddress",
				"tel",
				"businessHours",
				"tag",
				"tasty",
				"zipcode",
				"atmosphere",
				"gender",
				"gender1",
				"gender2",
				"cp");
	}
	
	//新增資料&檔案上傳
	@PostMapping(value = "/uploadData")
	public String postNewData(@ModelAttribute(name="foodRecord")FoodRecord fr,BindingResult result, HttpSession session) {
		Member member = (Member)session.getAttribute("member");   //session.getAttribute("member")是個物件，所以轉型別為Member的型別
		System.out.println("member = "+member);
		String[] suppressedFields = result.getSuppressedFields();   //SuppressedFields: 不允許的欄位
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}  //StringUtils.arrayToCommaDelimitedString(suppressedFields) 列出不允許的欄位用,區隔開
		
			MultipartFile productImage = fr.getProductImage();
			String originalFilename = productImage.getOriginalFilename();
			fr.setUploadPicture(originalFilename);
			//  建立Blob物件，交由 Hibernate 寫入資料庫
			if (productImage != null && !productImage.isEmpty() ) {
				try {
					byte[] b = productImage.getBytes();    //轉成位元組陣列
					Blob blob = new SerialBlob(b);    //new一個Serial Blob的物件
					fr.setCoverImage(blob);
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			fr.setMember_id(member);
			service.insertRF(fr);
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String rootDirectory = servletContext.getRealPath("/");
			try {
				File imageFolder = new File(rootDirectory, "images");
				if (!imageFolder.exists()) imageFolder.mkdirs();
				File file = new File(imageFolder, fr.getId() + ext);
				productImage.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		return "redirect:/theLastestRecord";
	}
	

	
	//修改食記(顯示之前的食記資料)
	@GetMapping("/editData")
	public ModelAndView showPreviousRecord(ModelAndView mav, @RequestParam(name = "id") Integer id,HttpSession session) {
		FoodRecord msg = service.findById(id);
		Member member = (Member)session.getAttribute("member"); 
		Integer memberID = member.getId();
		mav.getModel().put("memberID",memberID);
		mav.getModel().put("foodrecord", msg);
		System.out.println("顯示食記");
		mav.setViewName("record/editData");	
		return mav;
	}
	
	//修改食記(更新食記)
	@PostMapping(value = "/editData")
	public ModelAndView updateRecord(ModelAndView mav, @Valid @ModelAttribute(name="foodrecord") FoodRecord fr, BindingResult result,HttpSession session) {	
		mav.setViewName("record/editData");	
		FoodRecord sessionRecordId = (FoodRecord)session.getAttribute("sessionRecordId"); //拿食記的Id
		Member member = (Member)session.getAttribute("member"); 
		Integer RecordId = sessionRecordId.getId();
		FoodRecord currentRecord = service.findById(RecordId);
//		Integer memberID = member.getId();
		fr.setMember_id(member);
		System.out.println("目前的食記內容 "+currentRecord);
		if(!result.hasErrors()) {
			System.out.println("更新食記");
			 service.insertRF(fr);
			 System.out.println("成功存入");
			 mav.setViewName("redirect:/theLastestRecord");
		}	
		return mav;	
	}
	

	//刪除食記
	@GetMapping(value = "/deleteData")
	public ModelAndView deleteRecord(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		service.deleteByID(id);
		mav.setViewName("redirect:/RecordManagement"); // redirect到viewMessages這個Controller
		return mav;
	}
	
	//刪除食記
		@GetMapping(value = "/deleteData2")
		public ModelAndView deleteRecord2(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			service.deleteByID(id);
			mav.setViewName("redirect:/MemberRecordList"); // redirect到viewMessages這個Controller
			return mav;
		}
	
		
		
	
}

