package com.oldFoodMan.demo.model.lemon;

import java.sql.Blob;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.oldFoodMan.demo.model.Member;

public interface ReviewerSettingRepository extends JpaRepository<ReviewerSetting,Integer> {
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_title=:title where member_id=:id",nativeQuery = true)
	public void updateTitle(@Param("id") Integer id,@Param("title") String title);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_subtitle=:subtitle where member_id=:id",nativeQuery = true)
	public void updateSubTitle(@Param("id") Integer id,@Param("subtitle") String subtitle);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_intro=:intro where member_id=:id",nativeQuery = true)
	public void updateIntro(@Param("id") Integer id,@Param("intro") String intro);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_camera=:camera where member_id=:id",nativeQuery = true)
	public void updateCamera(@Param("id") Integer id,@Param("camera") String camera);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_occupation=:occupation where member_id=:id",nativeQuery = true)
	public void updateOccupation(@Param("id") Integer id,@Param("occupation") String occupation);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_cover=:cover where member_id=:id",nativeQuery = true)
	public void updateReviewer_cover(@Param("id") Integer id,@Param("cover") Blob cover);
	
	@Transactional
	@Modifying
	@Query(value="update reviewer_setting set reviewer_cover_filename=:covername where member_id=:id",nativeQuery = true)
	public void updateReviewer_filename(@Param("id") Integer id,@Param("covername") String covername);
	
	@Query(value="select * from reviewer_setting where member_id=:id",nativeQuery = true)
	public ReviewerSetting findByMember(@Param(value="id") Integer id);
	
	@Query(value="select member_id from reviewer_setting where member_id=:id",nativeQuery = true)
	public Integer queryMemberId(@Param(value="id") Integer id);
	
	@Transactional
	@Modifying
	@Query(value="delete from reviewer_setting where member_id=:id",nativeQuery = true)
	public void deletequeryMemberId(@Param(value="id") Integer id);
	
	@Query(value="select reviewer_cover_filename from reviewer_setting where member_id=:id",nativeQuery = true)
	public String fileNamequeryMemberId(@Param(value="id") Integer id);
}

