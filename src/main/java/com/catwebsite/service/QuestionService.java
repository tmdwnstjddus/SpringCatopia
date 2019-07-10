package com.catwebsite.service;

import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Question;
import com.catwebsite.vo.QuestionFile;
import com.catwebsite.vo.Question;
import com.catwebsite.vo.QuestionComment;

public interface QuestionService  {

	int registerQuestion(Question question);
	void registerQuestionFile(QuestionFile questionFile);
	ArrayList<Question> findQuestions();
	Question findQuestionByQuestionNo(int questionNo);
	List<QuestionFile> findQuestionFilesByQuestionNo(int questionNo);
	QuestionFile findQuestionFileByQuestionFileNo(int questionFileNo);
	
	void deleteQuestion (int questionNo);
	void deleteQuestionFile(int fileNo);
	
	void updateQuestion(Question question);
	void readCount(int questionNo);
	
	/* ==================================================== */

	void writeComment(QuestionComment comment);
	
	void deleteComment(int commentNo);

	void updateComment(QuestionComment comment);

	List<QuestionComment> findCommentListByQuestionNo(int questionNo);
	
	void writeRecomment(QuestionComment comment);
	
	List<Question> findQuestionlist(String category);

	
	
}


