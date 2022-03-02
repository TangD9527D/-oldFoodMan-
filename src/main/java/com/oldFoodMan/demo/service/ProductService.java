package com.oldFoodMan.demo.service;




import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.ProductRepository;





@Service
public class ProductService {
	
	@Autowired
	private ProductRepository dao;
	
	public List<Product> findAll(){
		return dao.findAll();
	}
	
	public void insertProduct(Product product) {
		dao.save(product);
	}
	
	public void deleteProduct(int productId) {
		dao.deleteById(productId);
	}
	
	public Product FindById(int productId) {
		Optional<Product> product = dao.findById(productId);
		Product p = product.get();
		double newPrice = p.getProduct_discount() * p.getProduct_price();
		p.setProduct_newPrice(newPrice);
		return p;
	}
	
	public List<Product> discount(){
		List<Product> a = dao.findAll();
		List<Product> b = new LinkedList<Product>();
		for(Product p:a) {
			double newPrice = p.getProduct_discount() * p.getProduct_price();
			p.setProduct_newPrice(newPrice);
			b.add(p);
		}
		return b;
	}
	
	
}
