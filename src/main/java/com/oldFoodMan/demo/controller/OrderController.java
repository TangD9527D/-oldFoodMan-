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
import com.oldFoodMan.demo.model.OrderDetail;
import com.oldFoodMan.demo.model.OrderForm;
import com.oldFoodMan.demo.service.CouponService;
import com.oldFoodMan.demo.service.OrderDetailService;
import com.oldFoodMan.demo.service.OrderFormService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderDetailService detailService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private OrderFormService formService;
	
	@GetMapping("/myOrder")
	public String toOrderPage(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Integer memberId = member.getId();
		List<OrderForm> forms = formService.findByOrderMemberId(memberId);
		model.addAttribute("forms", forms);
		return "myOrderPage";
	}
	
	@ResponseBody
	@PostMapping("/myorder/{orderNumber}")
	public List<OrderDetail> findDetail(@PathVariable int orderNumber){
		 return detailService.findmyDetail(orderNumber);
	}
}
