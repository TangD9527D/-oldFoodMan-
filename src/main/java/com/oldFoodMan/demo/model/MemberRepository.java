package com.oldFoodMan.demo.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {

	@Query("from Member where account = :account")
	public Optional <Member> findByAccount(@Param(value = "account") String account);
	
	@Query(value="SELECT city as 城市,COUNT(*) as 次數 FROM member GROUP BY city",nativeQuery=true)
	public List<String> countCity();
	
	@Query(value="SELECT MONTH(createDate) [Month], COUNT(1) [Months Count] FROM member GROUP BY YEAR(createDate), MONTH(createDate) ORDER BY 1",nativeQuery=true)
	public List<String> countYrMth();
}
