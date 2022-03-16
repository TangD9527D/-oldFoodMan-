package com.oldFoodMan.demo.controller;





import java.util.LinkedList;
import java.util.List;
import java.util.UUID;


import javax.mail.MessagingException;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.model.Coupon;
import com.oldFoodMan.demo.model.CouponMailDao;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OrderDetail;
import com.oldFoodMan.demo.model.OrderForm;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.ShoppingCart;
import com.oldFoodMan.demo.service.CouponService;
import com.oldFoodMan.demo.service.OrderDetailService;
import com.oldFoodMan.demo.service.OrderFormService;
import com.oldFoodMan.demo.service.ProductService;
import com.oldFoodMan.demo.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService service;
	
	@Autowired
	private ProductService proService;
	
	@Autowired
	private OrderFormService formService;
	
	@Autowired
	private OrderDetailService detailService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
    private CouponMailDao mailUtils; //寄信用
	
	
	
	
	
	@GetMapping("/shoppingCart")
	public String myShoppingCart(Model model) {
		return "shoppingCart";
	}
	
	@ResponseBody
	@PostMapping("/shoppingCart")
	public List<ShoppingCart> myAllProduct(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		List<ShoppingCart> myProducts = service.findProductsByMemberId(member);
	
		for(ShoppingCart p : myProducts) {
			double discount = p.getProductId().getProduct_discount();
			double price = p.getProductId().getProduct_price();
			double newPrice = discount * price;
			p.setProductPay(newPrice);
			
			int amount = p.getProductAmount();
			double newPay = amount * newPrice;
			p.setProductNewPay(newPay);
		}
		
		return myProducts;
	}
	
	@ResponseBody
	@PostMapping("/addCart/{product_id}")
	public String addtoCart(@PathVariable int product_id, HttpSession session) throws Exception{
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(product_id);
		service.addProductToCart(product, member); 
		return "";
	}
	
	@ResponseBody
	@PostMapping("/cart/increaseOne/{productId}")
	public ShoppingCart increaseOne(@PathVariable int productId, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(productId);
		ShoppingCart newCart = service.updateUpProductAmount(product, member);
		
		double discount = newCart.getProductId().getProduct_discount();
		double price = newCart.getProductId().getProduct_price();
		double newPrice = discount * price;
		newCart.setProductPay(newPrice);
		
		int amount = newCart.getProductAmount();
		double newPay = amount * newPrice;
		newCart.setProductNewPay(newPay);
		
		
		return newCart;
	}
	
	@ResponseBody
	@PostMapping("/cart/decreaseOne/{productId}")
	public ShoppingCart decreaseOne(@PathVariable int productId, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(productId);
		ShoppingCart newCart = service.updateLowProductAmount(product, member);
		
		double discount = newCart.getProductId().getProduct_discount();
		double price = newCart.getProductId().getProduct_price();
		double newPrice = discount * price;
		newCart.setProductPay(newPrice);
		
		int amount = newCart.getProductAmount();
		double newPay = amount * newPrice;
		newCart.setProductNewPay(newPay);
		
		return newCart;
	}
	
	@ResponseBody
	@PostMapping("/cart/psersonAuto/{productId}/{inputVal}")
	public ShoppingCart personAuto(@PathVariable int productId, @PathVariable int inputVal, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(productId);
		ShoppingCart newCart = service.updateAutoProductAmount(product, member, inputVal);
		
		double discount = newCart.getProductId().getProduct_discount();
		double price = newCart.getProductId().getProduct_price();
		double newPrice = discount * price;
		newCart.setProductPay(newPrice);
		
		int amount = newCart.getProductAmount();
		double newPay = amount * newPrice;
		newCart.setProductNewPay(newPay);
		
		return newCart;
	}
	
	@ResponseBody
	@PostMapping("/cart/deleteOneProduct/{productId}")
	public String deleteFromCart(@PathVariable int productId, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(productId);
		service.deleteFromCart(product, member);
		return "";
	}
	
	@ResponseBody
	@PostMapping("/Cart/findOne/{productId}")
	public ShoppingCart myOneProduct(@PathVariable int productId, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		ShoppingCart cart = service.findMyOneProduct(productId, member);
		
		return cart;
	}
	
	@ResponseBody
	@PostMapping("/Cart/deleteSelected")
	public String deleteSelected(@RequestBody String jsonPara, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		  //使用JSONArrayt處理json字符串
		JSONArray jsonArr = new JSONArray(jsonPara);
		String productId = "";
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArr.get(i);
			productId = jsonObject.getString("productId");
			System.out.println("productId:" + productId);
			Integer product_Id = Integer.parseInt(productId);
			Product product = service.findProductByID(product_Id);
			service.deleteFromCart(product, member);
	    }
		return "";
		
	}
	
	@ResponseBody
	@PostMapping("/Cart/toBuy")
	public List<ShoppingCart> GoToBuy(@RequestBody String jsonPara, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Integer memberId = member.getId();
		List<ShoppingCart> carts = new LinkedList<ShoppingCart>();
		
		//使用JSONArrayt處理json字串
		JSONArray jsonArr = new JSONArray(jsonPara);
		String productId = "";
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArr.get(i);
			productId = jsonObject.getString("productId");
			System.out.println("productId:" + productId);
			Integer product_Id = Integer.parseInt(productId);
			ShoppingCart cart = service.findByProAndMemId(product_Id, memberId);
			carts.add(cart);
			
	    }
		System.out.println(carts);
		return carts;
		
	}
	
	
	@ResponseBody
	@PostMapping("/Cart/confirmBuy")
	public String confirmBuy(@RequestBody String jsonPara, HttpSession session) throws MessagingException {
		Member member = (Member) session.getAttribute("member");
		Integer memberId = member.getId();
		String email = member.getAccount();
		  //使用JSONArrayt處理json字符串
		JSONArray jsonArr = new JSONArray(jsonPara);
		String productId = "";
		
		double formTotal = 0; 
		//用productId先產生發票(form)的total
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArr.get(i);
			productId = jsonObject.getString("productId");
			Integer product_Id = Integer.parseInt(productId);
			Product product = service.findProductByID(product_Id);
			
			
			//將已購買商品加入訂單TABLE  
			double onePrice = product.getProduct_price() * product.getProduct_discount();
			ShoppingCart cart = service.findByProAndMemId(product_Id,memberId);
			Integer ProductAmount = cart.getProductAmount();
			double shouldPay = onePrice * ProductAmount;
			formTotal += shouldPay;
			
	    }
		
		//有了發票的TOTAL後，先製作FORM才會有FORM編號給之後的明細用
		OrderForm form = new OrderForm();
		form.setOrderTotal(formTotal);
		form.setOrderMemberId(memberId);
		
		formService.insertForm(form);
		System.out.println("test:    "  + form.getOrderNumber());
		
		//有了form之後就可以再把值塞進detail裡
		String htmls = "";
		int couponId = 0;
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArr.get(i);
			productId = jsonObject.getString("productId");
			System.out.println("productId:" + productId);
			Integer product_Id = Integer.parseInt(productId);
			Product product = service.findProductByID(product_Id);
			
			
			//將已購買商品加入訂單TABLE  
			double onePrice = product.getProduct_price() * product.getProduct_discount();
			ShoppingCart cart = service.findByProAndMemId(product_Id,memberId);
			Integer ProductAmount = cart.getProductAmount();
			double shouldPay = onePrice * ProductAmount;
			//拿產品圖片寄信用
			String productImg = product.getProduct_image();
			
			
			OrderDetail detail = new OrderDetail();
			detail.setDetailNumber(form);
			detail.setDetailProductAmount(ProductAmount);
			detail.setDetailProductId(product);
			detail.setDetailProductTotal(shouldPay);
			detailService.insertDetail(detail);
			
			//結帳後刪除購物車內已購買物品
			service.deleteFromCart(product, member);   
			
			//結帳後更新商品庫存
			Product pro = proService.FindById(product_Id); 
			int oldStock = pro.getProduct_stock();
			int newStock = oldStock - ProductAmount;
			proService.updateStock(newStock , product_Id);
			
			//餐券序號製作塞表
			couponId = detail.getDetailId();
			for(int index = 0; index < ProductAmount; index++) {
				Coupon coupon = new Coupon();
				coupon.setCouponId(couponId);
				
				UUID uuid = UUID.randomUUID();

				// 得到物件產生的ID
				String couponNumber = uuid.toString();
				// 轉換為大寫
				couponNumber = couponNumber.toUpperCase();
				
				coupon.setCouponNumber(couponNumber);
				
				couponService.insertCoupon(coupon);
			}
			
			//拿到訂購的餐券序號，製作HTML
			String productName = product.getProduct_name();
			htmls += "<h2>" + productName + "</h2>\n";
			List<Coupon> myCoupons = couponService.findByCouponId(couponId);
			int count = 1;
			for(Coupon c : myCoupons) {
				String number = c.getCouponNumber();
				String html = "<h3>餐券序號" + count + " : " + number + "<h3>\n";
				htmls += html;
				count++;
			}
			
          
			
			
	    }
		
	        
			//寄出
			mailUtils.sendHtmlMail(email,"老食人餐券",
	                "<div style=\"text-align: center;position: absolute;\" >\n"
	                        + "<h1>\"感謝您訂購老食人餐券\"</h1>\n"
	                		+ "<img src=\"https://img.ruten.com.tw/s2/0/ef/d8/22020560000984_673.jpg\"/>\n"
	                        + "<h2>以下為您的餐券序號:</h2>\n"
	                        + htmls
	                        + "</div>");
			
	        System.out.println("有寄出去了!");
			
			
			
			return "";
		
	}
	
//   原本要用流水號，後來改自動產生ID
//	/**
//     * 獲取現在時間
//     * @return返回字串格式yyyyMMddHHmmss
//     */
//	  private String getStringDate() {
//		     Date currentTime = new Date();
//		     SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//		     String dateString = formatter.format(currentTime);
//		     System.out.println("TIME:::"+dateString);
//		     return dateString;
//		  }
//	  /**
//	   * 由年月日時分秒+3位隨機數
//	   * 生成流水號
//	   * @return
//	   */
//	  private String Getnum(){
//		  String t = getStringDate();
//		  int x=(int)(Math.random()*900)+100;
//		  String serial = t + x;
//		  return serial;
//	  }
//	  

	
}
