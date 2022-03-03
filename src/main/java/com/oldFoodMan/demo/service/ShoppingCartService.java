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
	
	public void addProductToCart(Product product_id, Member member_id) {
		ShoppingCart sc = new ShoppingCart();
		sc.setMember_id(member_id);
		sc.setProduct_id(product_id);
		shopDao.save(sc);
	}
	
	public void deleteProductFromCart(int product_id) {
		shopDao.deleteById(product_id);
	}
	
	
	
}
