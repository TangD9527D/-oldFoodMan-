package com.oldFoodMan.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Coupon;
import com.oldFoodMan.demo.model.CouponRepository;

@Service
public class CouponService {
	
	@Autowired
	private CouponRepository dao;
	
	public void insertCoupon(Coupon coupon) {
		dao.save(coupon);
	}
}
