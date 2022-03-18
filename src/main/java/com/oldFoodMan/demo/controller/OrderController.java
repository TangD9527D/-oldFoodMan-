package com.oldFoodMan.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.model.Coupon;
import com.oldFoodMan.demo.model.CouponMailDao;
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
	
	@Autowired
    private CouponMailDao mailUtils; //寄信用
	
//	@GetMapping("/myOrder")
//	public String toOrderPage(Model model, HttpSession session) {
//		Member member = (Member)session.getAttribute("member");
//		Integer memberId = member.getId();
//		List<OrderForm> forms = formService.findByOrderMemberId(memberId);
//		model.addAttribute("forms", forms);
//		return "myOrderPage";
//	}
	
	@ResponseBody
	@PostMapping("/myorder/{orderNumber}")
	public List<OrderDetail> findDetail(@PathVariable int orderNumber){
		 return detailService.findmyDetail(orderNumber);
	}
	
	@GetMapping("/myOrder")
	public String findPage(Model model, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		Integer memberId = member.getId();
		List<OrderForm> page = formService.findPage(1, memberId);
		int dataCount = formService.findCount(memberId);
		int pagenum = dataCount / 5;
		model.addAttribute("counts", dataCount);
		model.addAttribute("forms", page);
		model.addAttribute("pagenum", pagenum);
		return "myOrderPage";
	}
	
	@ResponseBody
	@PostMapping("/myOrderPage/{orderPage}")
	public List<OrderForm> findNewPage(@PathVariable(value = "orderPage") int orderPage, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		Integer memberId = member.getId();
		List<OrderForm> page = formService.findPage(orderPage, memberId);
		return page;
	}
	
	@ResponseBody
	@PostMapping("/searchOrder/{inputVal}")
	public List<OrderForm> searchOrder(@PathVariable(value="inputVal") String inputVal, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		Integer memberId = member.getId();
		List<OrderForm> page = formService.searchByTimeOrMoney(inputVal, memberId);
		return page;
	}
	
	@ResponseBody
	@PostMapping("/remailCoupon/{detailId}/{proName}")
	public String remail(@PathVariable(value="detailId") int detailId, @PathVariable(value="proName") String proName, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		String email = member.getAccount();
		List<Coupon> coupon = couponService.findByCouponId(detailId);
		String htmls = "<h2>" + proName + "</h2>";
		int count = 1;
		for(Coupon p :coupon) {
			String number = p.getCouponNumber();
			htmls += "<h3>餐券序號" + count + " : " + number + "<h3>\n";
			count++;
		}
		
		mailUtils.sendHtmlMail(email,"老食人補寄餐券",
                "<div style=\"text-align: center;position: absolute;\" >\n"
                        + "<h1>\"請留意餐券使用期限!逾期恕不補發。\"</h1>\n"
                		+ "<img src=\"https://cf.shopee.tw/file/d98e5a6f2c28af0e2913ab4f53df9ebe\"/>\n"
                        + "<h2>以下為您的餐券序號:</h2>\n"
                        + htmls
                        + "</div>");
		
        System.out.println("有寄出去了!");
        return "ok";
	}
	
	@ResponseBody
	@PostMapping("/findProductAmount")
	public Integer[] findProductAmount(){ //統計數量圖表
		Integer[] amount = detailService.findProductAmount();
		return amount;
	}
	
	@ResponseBody
	@PostMapping("/findOneDayTime/{year}/{month}/{day}")
	public List<List<String>> findOneDayTime(@PathVariable(value="year") String year, @PathVariable(value="month") String month, @PathVariable(value="day") String day){ //統計數量圖表
		String days = year + "/" + month + "/" + day;
		System.out.println(days);
		List<OrderForm> forms = formService.findOneDayTime(days);
		int between [] = new int[2];
		int last = forms.size();
		OrderForm f1 = forms.get(0);
		OrderForm flast = forms.get(last-1);
		int n1 = f1.getOrderNumber();
	    int n2 = flast.getOrderNumber();
	    List<List<String>> a = detailService.findqqq(n1,n2);
	    return a;
	    
		}
		
	}
	


