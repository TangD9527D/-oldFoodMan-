package com.oldFoodMan.demo.service.lemon;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerFoodRecordRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRatingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.service.FoodRecordService;

@Service
public class ReviewerFoodRecordService {

	@Autowired
	private FoodRecordService frs;
	
	@Autowired
	private FoodRecordRepository frr;
	
	@Autowired
	private ReviewerSaveRatingRepository rsrr;
	
	public List<ReviewerSaveRating> findAll(){
		List<ReviewerSaveRating> list = rsrr.findAll();
		return list;
	}
	
	public void saveRatingg(Integer record_id,ReviewerSaveRating rsr) {
		
		FoodRecord frds = frs.findById(record_id);
			
			Member member= frds.getMember_id();
			Integer memberId = member.getId();
			Integer gender = frds.getGender();
			Integer gender1 = frds.getGender1();
			Integer gender2 = frds.getGender2();
			Integer genderSum = gender+gender1+gender2;
			float genderAvg = genderSum/3;
			String storeName = frds.getShopName();
			String storeCity = frds.getCity();
			String storeArea = frds.getTown();
			String storeType = frds.getShopType();
			String articalTitle = frds.getCp();
			
			System.out.println("~~~~~~~~~");
			System.out.println(record_id);
			System.out.println(genderSum);
			System.out.println(genderAvg);
			System.out.println(storeName);
			System.out.println(storeCity);
			System.out.println(storeArea);
			System.out.println(storeType);
			System.out.println(articalTitle);
			System.out.println("~~~~~~~~~");
			
			
			rsr.setRecord_id(record_id);
			rsr.setMember_id(memberId);
			rsr.setGender_sum(genderSum);
			rsr.setGender_avg(genderAvg);
			rsr.setStore_name(storeName);
			rsr.setStore_city(storeCity);
			rsr.setStore_area(storeArea);
			rsr.setStore_type(storeType);
			rsr.setArtical_title(articalTitle);
			
			rsrr.save(rsr);
	}
		
	public ReviewerSaveRating findByMember(Integer memberId) {
		ReviewerSaveRating rsrReady = rsrr.findByMember(memberId);
		if(rsrReady!=null) {
			return rsrReady;
		} else {
			rsrr.insertByMember(memberId);
			ReviewerSaveRating rsrReadyy =  rsrr.findByMember(memberId);
			return rsrReadyy;
		}
	}
	
	public ReviewerSaveRating checkRsr(Integer record_id) {
		ReviewerSaveRating rsrReady = rsrr.findByRecord(record_id);
		if(rsrReady!=null) {
			return rsrReady;
		} else {
			ReviewerSaveRating rsrReadyy = new ReviewerSaveRating(); 
			return rsrReadyy;
		}
	}
	
	//CountStar
	public Integer countStr5(Integer member_id) {
		Integer star0 = frr.star5CountsG0(member_id);
		Integer star1 = frr.star5CountsG1(member_id);
		Integer star2 = frr.star5CountsG2(member_id);
		Integer rr = star0+star1+star2;
		return rr;
	}
	
	public Integer countStr4(Integer member_id) {
		Integer star0 = frr.star4CountsG0(member_id);
		Integer star1 = frr.star4CountsG1(member_id);
		Integer star2 = frr.star4CountsG2(member_id);
		Integer rr = star0+star1+star2;
		return rr;
	}
	
	public Integer countStr3(Integer member_id) {
		Integer star0 = frr.star3CountsG0(member_id);
		Integer star1 = frr.star3CountsG1(member_id);
		Integer star2 = frr.star3CountsG2(member_id);
		Integer rr = star0+star1+star2;
		return rr;
	}
	
	public Integer countStr2(Integer member_id) {
		Integer star0 = frr.star2CountsG0(member_id);
		Integer star1 = frr.star2CountsG1(member_id);
		Integer star2 = frr.star2CountsG2(member_id);
		Integer rr = star0+star1+star2;
		return rr;
	}

	public Integer countStr1(Integer member_id) {
		Integer star0 = frr.star1CountsG0(member_id);
		Integer star1 = frr.star1CountsG1(member_id);
		Integer star2 = frr.star1CountsG2(member_id);
		Integer rr = star0+star1+star2;
		return rr;
	}
	
	//CountConsume
	public Integer countPrice1(Integer member_id) {
		Integer cp =frr.price1Counts(member_id);
		return cp;
	}
	
	public Integer countPrice2(Integer member_id) {
		Integer cp =frr.price2Counts(member_id);
		return cp;
	}
	
	public Integer countPrice3(Integer member_id) {
		Integer cp =frr.price3Counts(member_id);
		return cp;
	}
	
	public Integer countPrice4(Integer member_id) {
		Integer cp =frr.price4Counts(member_id);
		return cp;
	}
	
	//citySort
	public List<FoodRecord> citySortRecord(Integer member_id,Integer cityValue){
		
		switch(cityValue) {
		
		case 1:
			List<FoodRecord> r1 = frr.recordcity1(member_id);
			return r1;
			
		case 15:
			List<FoodRecord> r15 = frr.recordcity15(member_id);
			return r15;
			
		default:
			List<FoodRecord> rr = frr.memberRecordList(member_id);
			return rr;
		}
		
	}
	
	//cityName
	public String cityValueName(Integer cityValue) {
		
		switch(cityValue) {
		
		case 1:
			String r1 = "台北市";
			return r1;
			
		case 15:
			String r15 = "花蓮縣";
			return r15;
		
		default:	
			String rr = "所有城市";
			return rr;
		}
	}
	
	//cityCount
	public Integer cityCount(Integer member_id,Integer cityValue) {
		
		switch(cityValue) {
		
		case 1:
			Integer r1 = frr.countcity1(member_id);
			return r1;
			
		case 15:
			Integer r15 = frr.countcity15(member_id);
			return r15;
			
		default:
			Integer rr = frr.recordCounts(member_id);
			return rr;
		}
	}
	
	//typeSortRecord
	public List<FoodRecord> typeSortRecord(Integer member_id,Integer cityValue){
			
			switch(cityValue) {
			
			case 1:
				List<FoodRecord> r1 = frr.recordtype1(member_id);
				return r1;
				
			case 15:
				List<FoodRecord> r15 = frr.recordcity15(member_id);
				return r15;
				
			default:
				List<FoodRecord> rr = frr.memberRecordList(member_id);
				return rr;
			}
			
		}
	
	//TypeName
		public String typeValueName(Integer cityValue) {
			
			switch(cityValue) {
			
			case 1:
				String r1 = "火鍋";
				return r1;
				
			case 15:
				String r15 = "花蓮縣";
				return r15;
			
			default:	
				String rr = "所有城市";
				return rr;
			}
		}
		
		//TypeCount
		public Integer typeCount(Integer member_id,Integer cityValue) {
			
			switch(cityValue) {
			
			case 1:
				Integer r1 = frr.counttype1(member_id);
				return r1;
				
			case 15:
				Integer r15 = frr.countcity15(member_id);
				return r15;
				
			default:
				Integer rr = frr.recordCounts(member_id);
				return rr;
			}
		}
		
		//priceSortRecord
		public List<FoodRecord> priceSortRecord(Integer member_id,Integer lowPrice,Integer highPrice){
				
			if(lowPrice==1) {
					
				switch(highPrice) {
				case 1:
					List<FoodRecord> r11 = frr.recordprice11(member_id);
					return r11;
				
				case 2:
					List<FoodRecord> r12 = frr.recordprice12(member_id);
					return r12;
				}
					
			}
				
			List<FoodRecord> rr = frr.memberRecordList(member_id);
			return rr;
		}
		
		//priceName
		public String priceValueName(Integer lowPrice,Integer highPrice) {
			
			if(lowPrice==1) {
				
				switch(highPrice){
					case 1:
						String r11 = "價錢區間 0-500";
						return r11;
						
					case 2:
						String r12 = "價錢區間 0-1000";
						return r12;
				}
			}
			
			String rr = "所有價位";
			return rr;
		}
		
		//priceCount
		public Integer priceCount(Integer member_id,Integer lowPrice,Integer highPrice) {
			
			if(lowPrice==1) {
				
				switch(highPrice) {
				case 1:
					Integer r11 = frr.countprice11(member_id);
					return r11;
					
				case 2:
					Integer r12 = frr.countprice12(member_id);
					return r12;
				}
					
			}
				
			Integer rr = frr.recordCounts(member_id);
			return rr;
					
		}
}
