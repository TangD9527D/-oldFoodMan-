package com.oldFoodMan.demo.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oldFoodMan.demo.dto.ProductDto;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.service.ProductService;
import com.oldFoodMan.demo.service.ShoppingCartService;



@Controller
public class ProductController {
	
	@Autowired
	private ProductService proService;
	
	@Autowired
	private ShoppingCartService shopService;
	
	private String returnUrl;
	
	@GetMapping("/productsBackStagePage")
	public String allBackProducts(Model model) {
//		List<Product> products = service.findAll();
//		model.addAttribute("products", products);
		return "productsBackStagePage";
	}
	
	@ResponseBody
	@PostMapping("/productsBackStagePage")
	public List<Product> allProduct() {
		//List<Product> products = service.findAll();
		List<Product> products = proService.discount();
		return products;
	}
	
	@ResponseBody
	@PostMapping("/deleteProduct/{product_id}")
	public List<Product> ajaxDeleteData(@PathVariable(name = "product_id") int productId){
		
		shopService.deleteAllOneFromCart(productId);  
		
		proService.deleteProduct(productId);
		
		return proService.discount();
	}
	
	
	SimpleDateFormat formatter = new SimpleDateFormat("/yyyy/MM/dd/");
	
	 @ResponseBody
	 @RequestMapping("/InsertProductPhoto")
	 public String fileUpload(MultipartFile file,HttpServletRequest request){
	  
	  //使用者未輸入圖片則預設圖片路徑
	  if(file == null) { 
		  this.returnUrl ="product_img/noImage/noProductImage.png";
		  return returnUrl;
	  }
		 
	  String time = formatter.format(new Date());
	  //圖片上傳伺服器後所在的資料夾
	  String realPath = request.getServletContext().getRealPath("/product_img") + time;
	  File folder = new File(realPath);
	  if(!folder.exists())
	   folder.mkdirs();

	  //修改圖片的名字（防止重複）
	  String oldName = file.getOriginalFilename();
	  String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."));

	  try {
	   //將檔案放到目標資料夾
	   file.transferTo(new File(folder,newName));

	   //返回圖片的URL
	   //String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/img" + time + newName;
	   this.returnUrl ="product_img" + time + newName;
	   
	   
	   
	   System.out.println("1:  " + returnUrl);
	   return returnUrl;
	   
	  } catch (IOException e) {
	   e.printStackTrace();
	  }
	  return null;
	 }
	
	@ResponseBody
	@PostMapping("/InsertProductData")
	public Product ajaxInsertData(@RequestBody ProductDto dto){
		String number = dto.getProduct_number();
		String name = dto.getProduct_name();
		String category = dto.getProduct_category();
		double price = dto.getProduct_price();
		double discount = dto.getProduct_discount();
		int stock = dto.getProduct_stock();
		String remark = dto.getProduct_remark();
		double new_price = price*discount;
		
		Product p = new Product();
		p.setProduct_number(number);
		p.setProduct_name(name);
		p.setProduct_category(category);
		p.setProduct_price(price);
		p.setProduct_discount(discount);
		p.setProduct_stock(stock);
		p.setProduct_remark(remark);
		p.setProduct_newPrice(new_price);
		p.setProduct_image(returnUrl);
		System.out.println("2:  " + returnUrl);
		proService.insertProduct(p);
		
		//return service.FindById(???);
		return p;
	}
	
	@ResponseBody
	@PostMapping("/updateDiolog/{product_id}")
	public Product ajaxUpdateData(@PathVariable(name = "product_id") int product_id){
		Product p = proService.FindById(product_id);
		double new_price = p.getProduct_discount()*p.getProduct_price();
		p.setProduct_newPrice(new_price);
		return p;
	}
	
	@ResponseBody
	@PostMapping("/updateProduct/{product_id}")
	public Product ajaxUpdateData(@RequestBody ProductDto dto, @PathVariable(name = "product_id") int product_id){
		String number = dto.getProduct_number();
		String name = dto.getProduct_name();
		String category = dto.getProduct_category();
		double price = dto.getProduct_price();
		double discount = dto.getProduct_discount();
		int stock = dto.getProduct_stock();
		String remark = dto.getProduct_remark();
		double new_price = price*discount;
		
		Product p = proService.FindById(product_id);
		p.setProduct_number(number);
		p.setProduct_name(name);
		p.setProduct_category(category);
		p.setProduct_price(price);
		p.setProduct_discount(discount);
		p.setProduct_stock(stock);
		p.setProduct_remark(remark);
		p.setProduct_newPrice(new_price);
		p.setProduct_image(returnUrl);
		proService.insertProduct(p);
		return p;
	}
	
	//---------------------------------------以上為產品後台API-----
	//---------------------------------------以下為產品前台API-----
	
	@GetMapping("/productsPage")
	public String allFrontProducts(Model model) {
		List<Product> products = proService.discount();
		model.addAttribute("allProducts", products);
		
		List<Product> advertises = proService.advertiseDisplayOther();
		model.addAttribute("advertises", advertises);
		
		Product advertise = proService.advadvertiseDisplayTop();
		model.addAttribute("advertise", advertise);
		return "productsPage";
	}
	
	@ResponseBody
	@PostMapping("/searchProduct/{inputVal}")
	public List<Product> searchProduct(@PathVariable(name = "inputVal") String inputVal){
		return proService.searchProduct(inputVal);
	}
	
	@ResponseBody
	@PostMapping("/searchAllProduct")
	public List<Product> searchAllProduct(){
		return proService.discount();
	}
	
}
