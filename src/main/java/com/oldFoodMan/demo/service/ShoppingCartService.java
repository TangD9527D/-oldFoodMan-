package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.ProductRepository;
import com.oldFoodMan.demo.model.ShoppingCart;
import com.oldFoodMan.demo.model.ShoppingCartRepository;

@Service
public class ShoppingCartService {
	
	@Autowired
	private ShoppingCartRepository shopDao;
	
	@Autowired
	private ProductRepository ProDao;
	
	public List<ShoppingCart> findAll(){
		return shopDao.findAll();
	}
	
	public Product findProductByID(int product_id) {
		Optional<Product> p = ProDao.findById(product_id);
		Product p1 = p.get();
		return p1;
	}
	
	
	public void addProductToCart(Product product, Member member) throws Exception {
		Integer product_id = product.getProduct_id();
		Integer member_id = member.getId();
		
		ShoppingCart cart1 = shopDao.findByProductIdAndMemberId(product_id, member_id);
		System.out.println("有嗎???????" + cart1);
		if(cart1 == null) {
			ShoppingCart cart2 = new ShoppingCart();
			cart2.setMember_id(member);
			cart2.setProduct_id(product);
			cart2.setProduct_amount(1);
			shopDao.save(cart2);
		}else {
			throw new Exception("購物車已有此商品!");
		}
		
	}
	
	public void updateUpProductAmount(Product product, Member member) {
//		Integer product_id = product.getProduct_id();
//		Integer member_id = member.getId();
//		System.out.println("product_id : " + product_id);
//		System.out.println("member_id :" + member_id);
//		ShoppingCart a = shopDao.findByProductIdAndMemberId(product_id, member_id);
//		System.out.println(a);
//		
//		System.out.println("memid:  " + a.getMember_id().getId());
//		System.out.println("amount:  " + a.getProduct_amount());
//		Integer product_amount = a.getProduct_amount();
//
//		a.setProduct_amount(product_amount+1);
//		shopDao.save(a);
		
		Integer product_id = product.getProduct_id();
		Integer member_id = member.getId();
		System.out.println("product_id : " + product_id);
		System.out.println("member_id :" + member_id);
		ShoppingCart a = shopDao.findByProductIdAndMemberId(product_id, member_id);
		int Product_amount = a.getProduct_amount();
		
		ShoppingCart cart = new ShoppingCart();
		cart.setMember_id(member);
		cart.setProduct_id(product);
		cart.setProduct_amount(Product_amount+1);
		shopDao.delete(a);
		shopDao.save(cart);
		
	}
	
	public void updateLowProductAmount(Product product, Member member) {
		Integer product_id = product.getProduct_id();
		Integer member_id = member.getId();
		System.out.println("product_id : " + product_id);
		System.out.println("member_id :" + member_id);
		ShoppingCart a = shopDao.findByProductIdAndMemberId(product_id, member_id);
		int Product_amount = a.getProduct_amount();
		
		ShoppingCart cart = new ShoppingCart();
		cart.setMember_id(member);
		cart.setProduct_id(product);
		cart.setProduct_amount(Product_amount-1);
		shopDao.delete(a);
		shopDao.save(cart);
		
	}
	
	
}
