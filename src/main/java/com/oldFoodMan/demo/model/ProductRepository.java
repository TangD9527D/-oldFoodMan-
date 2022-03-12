package com.oldFoodMan.demo.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
									
	public List<Product> findAll();
	
	@Transactional
	@Modifying
	@Query(value = "update product set product_stock = :product_stock where product_id = :product_id", nativeQuery = true)
	public void UpdateStock(@Param(value = "product_stock") int product_stock, @Param(value = "product_id") int product_id);
	
	@Query(value = "select * from product where product_name LIKE %:inputVal% or product_category LIKE %:inputVal%", nativeQuery = true)
	public List<Product> searchProduct(@Param(value = "inputVal") String inputVal);
}
