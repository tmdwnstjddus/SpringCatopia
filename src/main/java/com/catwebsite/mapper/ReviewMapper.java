package com.catwebsite.mapper;


import java.util.HashMap;
import java.util.List;

import com.catwebsite.vo.Member;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.ReviewComment;
import com.catwebsite.vo.ReviewFile;

//이 인터페이스의 패키지와 인터페이스 이름은 member-mapper.xml 파일의 namespace와 일치
public interface ReviewMapper {
	
	Review selectReview(int reviewNo);
	
	List<Review> selectReviews();
	
	Review selectReviewByReviewNo(int reviewNo);
	
	List<ReviewFile> selectReviewFilesByReviewNo(int reviewNo);
	
	ReviewFile selectReviewFileByReviewFileNo(int reviewFileNo);
	
	void deleteReview(int reviewNo);
	
	void insertReview(Review review);
	
	void insertReview2(Review review);
	
	void insertReviewFile(ReviewFile file);

	void deleteReviewFile(int reviewFileNo);
	
	void updateReview(Review review);
	
	void updateCount(int reviewNo);
	
	/* ==================================================== */

	void insertComment(ReviewComment  comment);
	
	void updateComment(ReviewComment comment);

	void deleteComment(int commentNo);

	List<ReviewComment> selectCommentsByReviewNo(int reviewNo);
	
	void updateCommentStep(ReviewComment comment);
	
	void insertRecomment(ReviewComment comment);
	ReviewComment selectCommentByCommentNo(int commentNo);

	//List<Review> selectReviewlist(String category);
	List<Review> selectReviewlist(HashMap<String, Object> params);

}
	
