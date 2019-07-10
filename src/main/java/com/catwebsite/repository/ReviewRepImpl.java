package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

import com.catwebsite.mapper.ReviewMapper;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.ReviewComment;
import com.catwebsite.vo.ReviewFile;


public class ReviewRepImpl implements ReviewRep {
	
	private SqlSessionTemplate sessionTemplate;
	
	
	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	private ReviewMapper reviewMapper;	

	public ReviewMapper getReviewMapper() {
		return reviewMapper;
	}

	public void setReviewMapper(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	//JDBC의 구조 코드를 단순하게 만드는 스프링의 클래스 
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertReview(Review review) {

		reviewMapper.insertReview(review);
		return review.getReviewNo();
		
	}
	
	@Override
	public void insertReviewFile(ReviewFile file) {
		System.out.println(file);
		reviewMapper.insertReviewFile(file);
	
	}
		
	@Override
	public ArrayList<Review> selectReviews() {

		List<Review> review = reviewMapper.selectReviews();

		return (ArrayList<Review>) review; // 호출한 곳으로 조회한 데이터를 반환

	}
	
	@Override
	public Review selectReview(int reviewNo) {
			
		Review review = reviewMapper.selectReview(reviewNo);
			
		return review;
	}

@Override
public ArrayList<ReviewFile> selectReviewFile(int reviewNo) {
	
	List<ReviewFile> files = reviewMapper.selectReviewFilesByReviewNo(reviewNo);
	
	return (ArrayList<ReviewFile>)files;
	}
	
	@Override
	public ReviewFile selectReviewFileByReviewFileNo(int fileNo) {
		ReviewFile file = //sessionTemplate.selectOne(
	//			"com.springdemoweb.mapper.questionMapper.selectUploadFileByUploadFileNo",fileNo);
				reviewMapper.selectReviewFileByReviewFileNo(fileNo);
		return file; //호출한 곳으로 조회한 데이터를 반환
	}
	
	
	@Override
	public ArrayList<ReviewFile> selectReviewFilesByReviewNo(int reviewNo) {
	//	List<UploadFile> files = sessionTemplate.selectList(
	//			"com.springdemoweb.mapper.questionMapper.selectUploadFilesByUploadNo",uploadno);
		List<ReviewFile> files = reviewMapper.selectReviewFilesByReviewNo(reviewNo);
		
	    return (ArrayList<ReviewFile>)files;  //호출한 곳으로 조회한 데이터를 반환
	 }
	
	@Override
	public Review selectReviewByReviewNo(int reviewNo) {
	//	Upload upload = sessionTemplate.selectOne(
	//			"com.springdemoweb.mapper.questionMapper.selectUploadByUploadNo",uploadNo);
		Review review = reviewMapper.selectReviewByReviewNo(reviewNo);
	    return review; //호출한 곳으로 조회한 데이터를 반환
	 }
	
	@Override
	public void deleteReview(int reviewNo) {
		
		//sessionTemplate.delete("com.springdemoweb.mapper.questionMapper.deleteUpload", uploadNo);
		
		reviewMapper.deleteReview(reviewNo);
		
	}

	@Override
	public void deleteReviewFile(int fileNo) {
	
		//sessionTemplate.delete(
		//		"com.springdemoweb.mapper.questionMapper.deleteUploadFile", fileNo);
		reviewMapper.deleteReviewFile(fileNo);
		
	}

	@Override
	public void updateReview(Review review) {
		sessionTemplate.update(
				"com.catwebsite.mapper.ReviewMapper.updateReview", review);
		//questionMapper.updateUpload(upload);
	}

	@Override
	public void updateCount(int reviewNo) {
		reviewMapper.updateCount(reviewNo);
	}
	
/* ==================================================== */
	
	@Override
	public void insertComment(ReviewComment comment) {

		//sessionTemplate.insert(
		//	"com.springdemoweb.mapper.questionMapper.insertComment", comment);
		reviewMapper.insertComment(comment);
	}
	
	@Override
	public void updateComment(ReviewComment comment) {
		
		//sessionTemplate.update(
		//	"com.springdemoweb.mapper.questionMapper.updateComment", comment);
		reviewMapper.updateComment(comment);
	}
	
	@Override
	public void deleteComment(int commentNo) {
				
		//sessionTemplate.delete(
		//	"com.springdemoweb.mapper.questionMapper.deleteComment", commentNo);
		reviewMapper.deleteComment(commentNo);
	}

	@Override
	public ArrayList<ReviewComment> selectCommentsByReviewNo(int reviewNo) {
		List<ReviewComment> comments =
//			sessionTemplate.select(
//				"com.springdemoweb.mapper.questionMapper.selectCommentsByUploadNo", uploadNo);
			reviewMapper.selectCommentsByReviewNo(reviewNo);
		return (ArrayList<ReviewComment>)comments;
	}
	
	@Override
	public ReviewComment selectCommentByCommentNo(int commentNo) {
		ReviewComment comment =
//			sessionTemplate.select(
//				"com.springdemoweb.mapper.questionMapper.selectCommentByCommentNo", commentNo);
			reviewMapper.selectCommentByCommentNo(commentNo);
		return comment;
	}
	
	@Override
	public void updateCommentStep(ReviewComment comment) {
//		sessionTemplate.update(
//			"com.springdemoweb.mapper.questionMapper.updateCommentStep", params);
		reviewMapper.updateCommentStep(comment);
	}
	
	@Override
	public void insertRecomment(ReviewComment comment) {

		//sessionTemplate.insert(
		//	"com.springdemoweb.mapper.questionMapper.insertComment", comment);
		reviewMapper.insertRecomment(comment);
	}

	@Override
	public ArrayList<Review> selectReviewlist(String category) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("category", category);
		//List<Review> reviews = reviewMapper.selectReviewlist(category);
		List<Review> reviews = reviewMapper.selectReviewlist(params);
		
		return (ArrayList<Review>) reviews;
	}
	


}


