package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Question;
import com.catwebsite.vo.QuestionFile;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.QuestionComment;
import com.catwebsite.vo.Question;

public interface QuestionRep {

	
	void insertQuestionFile(QuestionFile file);

	List<Question> selectQuestions();

	Question selectQuestion(int questionNo);

	ArrayList<QuestionFile> selectQuestionFile(int questionNo);

	QuestionFile selectQuestionFileByQuestionFileNo(int fileNo);

	ArrayList<QuestionFile> selectQuestionFilesByQuestionNo(int questionNo);

	Question selectQuestionByQuestionNo(int questionNo);

	void deleteQuestion(int questionNo);

	void deleteQuestionFile(int fileNo);

	void updateQuestion(Question question);

	int insertQuestion(Question question);

	void updateCount(int questionNo);
	
	/* ==================================================== */
	
	void insertComment(QuestionComment comment);
	
	void updateComment(QuestionComment comment);

	void deleteComment(int commentNo);

	ArrayList<QuestionComment> selectCommentsByQuestionNo(int questionNo);
	
	QuestionComment selectCommentByCommentNo(int commentNo);
	
	void updateCommentStep(QuestionComment comment);
	
	void insertRecomment(QuestionComment comment);
	
	List<Question> selectQuestionlist(String category);


}