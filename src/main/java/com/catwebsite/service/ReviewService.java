package com.catwebsite.service;

import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Review;
import com.catwebsite.vo.ReviewComment;
import com.catwebsite.vo.ReviewFile;

public interface ReviewService  {

	int registerReview(Review review);
	void registerReviewFile(ReviewFile reviewFile);
	ArrayList<Review> findReviews();
	Review findReviewByReviewNo(int reviewNo);
	List<ReviewFile> findReviewFilesByReviewNo(int reviewNo);
	ReviewFile findReviewFileByReviewFileNo(int reviewFileNo);
	
	void deleteReview (int reviewNo);
	void deleteReviewFile(int fileNo);
	
	void updateReview(Review review);
	void readCount(int reviewNo);
	
	/* ==================================================== */

	void writeComment(ReviewComment comment);
	
	void deleteComment(int commentNo);

	void updateComment(ReviewComment comment);

	List<ReviewComment> findCommentListByReviewNo(int reviewNo);
	
	void writeRecomment(ReviewComment comment);
	List<Review> findReviewlist(String category);

	
	
}


