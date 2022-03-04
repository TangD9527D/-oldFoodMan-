package com.oldFoodMan.demo.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.ShoppingCart;
import com.oldFoodMan.demo.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService service;
	
	@GetMapping("/shoppingCart")
	public String myShoppingCart(Model model) {
		List<ShoppingCart> myProducts = service.findAll();
		model.addAttribute("myProducts", myProducts); 
		return "shoppingCart";
	}
	
//	@ResponseBody
//	@PostMapping("/shoppingCart")
//	public List<ShoppingCart> allProduct() {
//		List<ShoppingCart> myproducts = service.findAll();
//		return myproducts;
//	}
	
	@ResponseBody
	@PostMapping("/addCart/{product_id}")
	public String addtoCart(@PathVariable int product_id, HttpSession session) throws Exception{
		Member member = (Member)session.getAttribute("member");
		Product product = service.findProductByID(product_id);
		service.addProductToCart(product, member); 
		return "";
	}
	
	
}
