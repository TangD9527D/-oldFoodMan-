package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;

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
	
	public List<ShoppingCart> findProductsByMemberId(Member member){
		return shopDao.findByMemberId(member);
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
			cart2.setMemberId(member);
			cart2.setProductId(product);
			cart2.setProductAmount(1);
			shopDao.save(cart2);
		}else {
			throw new Exception("購物車已有此商品!");
		}
		
	}
	
	public ShoppingCart updateUpProductAmount(Product product, Member member) {
//      這樣應該是可以的，但實際跑不行，先用下方先刪除再加的作法
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
		int Product_amount = a.getProductAmount();
		
//		//判斷使用者有無超過商品庫存數量  3/6測試看看
//		Integer stock = product.getProduct_stock();
//		if(Product_amount > stock) {
//			return null;
//		}else {
//			ShoppingCart cart = new ShoppingCart();
//			cart.setMemberId(member);
//			cart.setProductId(product);
//			cart.setProductAmount(Product_amount+1);
//			shopDao.delete(a);
//			shopDao.save(cart);
//			
//			ShoppingCart newCart = shopDao.findByProductIdAndMemberId(product_id, member_id);
//			return newCart;
//		}
		
		
		
		ShoppingCart cart = new ShoppingCart();
		cart.setMemberId(member);
		cart.setProductId(product);
		cart.setProductAmount(Product_amount+1);
		shopDao.delete(a);
		shopDao.save(cart);
		
		ShoppingCart newCart = shopDao.findByProductIdAndMemberId(product_id, member_id);
		return newCart;
		
	}
	
	public void updateLowProductAmount(Product product, Member member) {
		Integer product_id = product.getProduct_id();
		Integer member_id = member.getId();
		System.out.println("product_id : " + product_id);
		System.out.println("member_id :" + member_id);
		ShoppingCart a = shopDao.findByProductIdAndMemberId(product_id, member_id);
		int Product_amount = a.getProductAmount();
		
//		//判斷使用者點擊數量有無低於0   3/6測試看看
//		Integer stock = product.getProduct_stock();
//		if(Product_amount <= 0) {
//			return null;
//		}else {
//			ShoppingCart cart = new ShoppingCart();
//			cart.setMemberId(member);
//			cart.setProductId(product);
//			cart.setProductAmount(Product_amount-1);
//			shopDao.delete(a);
//			shopDao.save(cart);
//		}
		
		ShoppingCart cart = new ShoppingCart();
		cart.setMemberId(member);
		cart.setProductId(product);
		cart.setProductAmount(Product_amount-1);
		shopDao.delete(a);
		shopDao.save(cart);
	}
	
	public ShoppingCart updateAutoProductAmount(Product product, Member member, Integer inputVal) {
		Integer product_id = product.getProduct_id();
		Integer member_id = member.getId();
		ShoppingCart a = shopDao.findByProductIdAndMemberId(product_id, member_id);
		shopDao.delete(a);
		
		//要直接幫使用者改最小或最大嗎???還是回歸未更動前的數量?
		Integer stock = product.getProduct_stock();
		if(inputVal > stock) {
			ShoppingCart cart = new ShoppingCart();
			cart.setMemberId(member);
			cart.setProductId(product);
			cart.setProductAmount(stock);
			shopDao.save(cart);
		}else if(inputVal <= 0) {
			ShoppingCart cart = new ShoppingCart();
			cart.setMemberId(member);
			cart.setProductId(product);
			cart.setProductAmount(1);
			shopDao.save(cart);
		}else {
			ShoppingCart cart = new ShoppingCart();
			cart.setMemberId(member);
			cart.setProductId(product);
			cart.setProductAmount(inputVal);
			shopDao.save(cart);
		}
		return shopDao.findByProductIdAndMemberId(product_id, member_id);
	}
	
//	//點擊按鈕刪除單筆購物車商品 3/6試試看
//	public void deleteFromCart(Product product, Member member) {
//		Integer member_id = (Integer)member.getId();
//		Integer product_id = product.getProduct_id();
//		
//		ShoppingCart cart = shopDao.findByProductIdAndMemberId(product_id, member_id);
//		shopDao.delete(cart);
//	}
	
	
}
