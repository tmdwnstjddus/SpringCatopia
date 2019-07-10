package com.catwebsite.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.catwebsite.repository.ReviewRep;
import com.catwebsite.vo.Question;
import com.catwebsite.vo.QuestionFile;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.ReviewComment;
import com.catwebsite.vo.ReviewFile;

public class ReviewServiceImpl implements ReviewService {
	
	private ReviewRep reviewRep;
	
	public ReviewRep getReviewRep() {
		return reviewRep;
	}

	
	public void setReviewRep(ReviewRep reviewRep) {
		this.reviewRep = reviewRep;
	}

	@Override
	public ArrayList<Review> findReviews(){
		
		List<Review> reviews = reviewRep.selectReviews();
		return (ArrayList<Review>)reviews;
	}

	@Override
	public int registerReview(Review review) {
		int newReviewNo = reviewRep.insertReview(review);
		for(ReviewFile file : review.getFiles()) {
			file.setReviewNo(newReviewNo);
			reviewRep.insertReviewFile(file);
			System.out.println(file);System.out.println(newReviewNo);
		}
		return newReviewNo;
	}

	@Override
	public void registerReviewFile(ReviewFile reviewFile) {
		reviewRep.insertReviewFile(reviewFile);
		
	}


	@Override
	public Review findReviewByReviewNo(int reviewNo) {
		Review review = reviewRep.selectReviewByReviewNo(reviewNo);
		return review;
	}


	@Override
	public List<ReviewFile> findReviewFilesByReviewNo(int reviewNo) {
		List<ReviewFile> files = reviewRep.selectReviewFilesByReviewNo(reviewNo);
		return files;
	}
	
	@Override
	public ReviewFile findReviewFileByReviewFileNo(int reviewFileNo) {
		ReviewFile file = reviewRep.selectReviewFileByReviewFileNo(reviewFileNo);
		return file;
	}


	@Override
	public void deleteReview(int reviewNo) {
		
		reviewRep.deleteReview(reviewNo);
		
	}

	@Override
	public void deleteReviewFile(int fileNo) {
		
		reviewRep.deleteReviewFile(fileNo);	
		
	}


	@Override
	public void updateReview(Review review) {
		
		reviewRep.updateReview(review);
		
	}


	@Override
	public void readCount(int reviewNo) {
		reviewRep.updateCount(reviewNo);
	}
	
/* ==================================================== */
	
	@Override
	public void writeComment(ReviewComment comment) {
		
		reviewRep.insertComment(comment);
		
	}
	
	@Override
	public void deleteComment(int commentNo) {
		reviewRep.deleteComment(commentNo);
	}

	@Override
	public void updateComment(ReviewComment comment) {
		reviewRep.updateComment(comment);		
	}

	@Override
	public List<ReviewComment> findCommentListByReviewNo(int reviewNo) {
		List<ReviewComment> comments = reviewRep.selectCommentsByReviewNo(reviewNo);
		return comments;
	}
	
	@Override
	public void writeRecomment(ReviewComment comment) {		
		
		ReviewComment parent = reviewRep.selectCommentByCommentNo(comment.getCommentNo());
		reviewRep.updateCommentStep(parent);
		
		comment.setGroupNo(parent.getGroupNo());
		comment.setDepth(parent.getDepth() + 1);
		comment.setStep(parent.getStep() + 1);		
		
		reviewRep.insertRecomment(comment);
	}


	@Override
	public List<Review> findReviewlist(String category) {
		List<Review> reviews = reviewRep.selectReviewlist(category);
		return reviews;
	}
	


}
