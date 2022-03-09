package com.oldFoodMan.demo.controller;




import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

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


import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OrderForm;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.ShoppingCart;
import com.oldFoodMan.demo.service.OrderFormService;
import com.oldFoodMan.demo.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService service;
	
	@Autowired
	private OrderFormService orderService;
	
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
	public String confirmBuy(@RequestBody String jsonPara, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		Integer memberId = member.getId();
		  //使用JSONArrayt處理json字符串
		JSONArray jsonArr = new JSONArray(jsonPara);
		String productId = "";
		String orderNumber = Getnum();
		
		for (int i = 0; i < jsonArr.length(); i++) {
			JSONObject jsonObject = (JSONObject) jsonArr.get(i);
			productId = jsonObject.getString("productId");
			System.out.println("productId:" + productId);
			Integer product_Id = Integer.parseInt(productId);
			Product product = service.findProductByID(product_Id);
			
			
			//將已購買商品加入訂單TABLE
			String productName = product.getProduct_name();
			double orderPrice = product.getProduct_price() * product.getProduct_discount();
			ShoppingCart cart = service.findByProAndMemId(product_Id,memberId);
			Integer ProductAmount = cart.getProductAmount();
			
			
			OrderForm order = new OrderForm();
			order.setOrderProductName(productName);
			order.setOrderPrice(orderPrice);
			order.setOrderMemberId(memberId);
			order.setOrderCoupon(UUID.randomUUID()+""+memberId);
			order.setOrderAmount(ProductAmount);
			order.setOrderNumber(orderNumber);
			
			orderService.insertNewOrder(order);        //商品資訊加入訂單TABLE
			service.deleteFromCart(product, member);   //結帳後刪除購物車內已購買物品
			
			
			
	    }
		return "";
		
	}
	
	
	
	/**
     * 獲取現在時間
     * @return返回字串格式yyyyMMddHHmmss
     */
	  private String getStringDate() {
		     Date currentTime = new Date();
		     SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		     String dateString = formatter.format(currentTime);
		     System.out.println("TIME:::"+dateString);
		     return dateString;
		  }
	  /**
	   * 由年月日時分秒+3位隨機數
	   * 生成流水號
	   * @return
	   */
	  private String Getnum(){
		  String t = getStringDate();
		  int x=(int)(Math.random()*900)+100;
		  String serial = t + x;
		  return serial;
	  }
	  

	
}
