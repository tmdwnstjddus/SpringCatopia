package com.catwebsite.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.catwebsite.common.Util;
import com.catwebsite.repository.QuestionRep;
import com.catwebsite.repository.QuestionRepImpl;
import com.catwebsite.service.QuestionService;
import com.catwebsite.view.DownloadView;
import com.catwebsite.vo.QuestionFile;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.QuestionComment;
import com.catwebsite.vo.Question;
import com.catwebsite.vo.Question;
@Controller
@RequestMapping(path = "/qa-upload")
public class QuestionController {

	@Autowired
	@Qualifier("questionService")
	private QuestionService questionService;
	
	@RequestMapping(path = "/qa-list", method = RequestMethod.GET)
	public String list(Model model) {
		
		ArrayList<Question> questions = questionService.findQuestions();
		ArrayList<Question> notice = questionService.findQuestions();
		
		for(Question question : questions) {
			question.setAnswer(false);
			List<QuestionComment> comments = questionService.findCommentListByQuestionNo(question.getQuestionNo());
			for(QuestionComment comment : comments) {
				if(comment.getWriter().equals("manager")) {
					question.setAnswer(true);
				}
			}
		}
		
		model.addAttribute("questions", questions);
		model.addAttribute("notice", notice);
		
		return "question/qa-list"; 
	}
	
	@RequestMapping(path="/qa-write", method = RequestMethod.GET)
	public String writeForm() {
		
		return "question/qa-write"; 
	}
	
	@RequestMapping(path="/qa-write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest req, Question question, Model model) {
		
		System.out.println(question);
		
		MultipartFile mf = req.getFile("attach");
		if(mf != null) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/upload-files");
			
			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) {
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			
			String savedFileName = Util.makeUniqueFileName(userFileName);
			
			try {
				mf.transferTo(new File(path, savedFileName));
											
				QuestionFile questionFile = new QuestionFile();
				questionFile.setUserFileName(userFileName);
				questionFile.setSavedFileName(savedFileName);
				ArrayList<QuestionFile> files = new ArrayList<QuestionFile>();
				files.add(questionFile);
				question.setFiles(files);
				
				questionService.registerQuestion(question);
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
		}
		model.addAttribute("question",question);
		
		//return "redirect:qa-list";  //상대경로
		return "redirect:coding.do";
	}
	
//	@RequestMapping(path="/qa-detail", method = RequestMethod.GET)
//	public String detail(@RequestParam(name="questionno")int questionNo, Model model) {
//    
//	      
//	      QuestionRep dao = new QuestionRepImpl();
//	      
//	      Question question = dao.selectQuestion(questionNo);
//	      if (question == null) { 
//
//	         return "redirect:list";
//	      }
//	      
//	      List<QuestionFile> files = questionService.findQuestionFilesByQuestionNo(questionNo);
//	      question.setFiles((ArrayList<QuestionFile>)files); 
//	      
//	      
//	      model.addAttribute("question", question);
//	       
//		
//		return "question/qa-detail";
//	}
	
	
	@RequestMapping(path="/qa-detail/{questionNo}", method = RequestMethod.GET)
	public String detail2(@PathVariable int questionNo, Model model) {
		
	      
	      Question question = questionService.findQuestionByQuestionNo(questionNo);
	      if (question == null) {

	         return "redirect:qa-list";
	      }
	      
	      List<QuestionFile> files = questionService.findQuestionFilesByQuestionNo(questionNo);
	      question.setFiles((ArrayList<QuestionFile>)files); 
	      
	      List<QuestionComment> comments = questionService.findCommentListByQuestionNo(questionNo);
	      question.setComments(comments);
	      
	      questionService.readCount(questionNo);
	      
	    
	      model.addAttribute("question", question);
		
		return "question/qa-detail"; 
	}
	
	@RequestMapping(path="/download/{fileNo}", method = RequestMethod.GET)
	public View download(@PathVariable int fileNo, Model model) {
    
		
	      
	      QuestionFile file = questionService.findQuestionFileByQuestionFileNo(fileNo);
	      if (file == null) { 
	         
	    	  return new RedirectView("/question/qa-list");
	      }
	      
	      model.addAttribute("file",file); //View 객체로 전달할 데이터 저장(Request에 저장)
	      
	      DownloadView v = new DownloadView();
	      return v;
	    
	}
	
	@RequestMapping(path="/delete/{questionNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int questionNo) {
	      
	      questionService.deleteQuestion(questionNo);
	          
	      return "redirect:/qa-upload/qa-list"; 
	    
	}
	
	//@PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
		@RequestMapping(path = "/qa-update/{questionNo}", method = RequestMethod.GET)
		public String updateForm(@PathVariable  int questionNo, Model model) {

			
			
			Question question = questionService.findQuestionByQuestionNo(questionNo);
			if (question == null) { //uploadno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
				return "redirect:/question/qa-list";
			}		
			List<QuestionFile> files = questionService.findQuestionFilesByQuestionNo(questionNo);
			question.setFiles((ArrayList<QuestionFile>)files); //Upload : UploadFile == 1 : Many
			 
			
			
			//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
			model.addAttribute("question", question);

			
			return "question/qa-update";
		}
		
		//@PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
		@RequestMapping(path = "/delete-file/{questionNo}/{fileNo}", method = RequestMethod.GET)
		public String deleteFile(
				@PathVariable int questionNo, @PathVariable int fileNo, Model model) {
			
			QuestionFile file = questionService.findQuestionFileByQuestionFileNo(fileNo);
			
			//파일 삭제
			File f = new File(file.getSavedFileName());
			if (f.exists()) {
				f.delete();
			}		
			//데이터베이스에서 파일 데이터 삭제		
			questionService.deleteQuestionFile(fileNo);

			
			return "redirect:/qa-upload/qa-update/" + questionNo;
		}
		
		@RequestMapping(path = "/qa-update", method = RequestMethod.POST)
		public String update(MultipartHttpServletRequest req, Question question) {

			MultipartFile mf = req.getFile("attach");
			if(mf != null) {
				
				ServletContext application = req.getServletContext();
				String path = application.getRealPath("/upload-files");
				
				String userFileName = mf.getOriginalFilename();
				if (userFileName.contains("\\")) { 
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				
				String savedFileName = Util.makeUniqueFileName(userFileName);
				//원본 파일과 저장하는 파일이 달라야 함
				
				try {
					mf.transferTo(new File(path, savedFileName));
				
					QuestionFile questionFile = new QuestionFile();
					questionFile.setUserFileName(userFileName);
					questionFile.setSavedFileName(savedFileName);
					questionFile.setQuestionNo(question.getQuestionNo());
					questionService.registerQuestionFile(questionFile);
					
					//데이터 저장
					questionService.updateQuestion(question);
					
				}catch(Exception ex) {
					ex.printStackTrace();
				}
				
			}

			
			return "redirect:/qa-upload/qa-detail/" + question.getQuestionNo();
		}
		
		/* ================================================================= */
		
		@RequestMapping(path = "/write-comment", 
						method = RequestMethod.POST, 
						produces = "text/plain;charset=utf-8") //응답 컨텐츠의 종류 지정
		@ResponseBody //반환 값은 뷰이름이 아니고 응답컨텐츠입니다
		public String writeComment(QuestionComment comment) {
			
			questionService.writeComment(comment);
			
			
			return "success"; // WEB-INF/views/success.jsp
		}
		
		@RequestMapping(path = "/write-recomment", 
				method = RequestMethod.POST, 
				produces = "text/plain;charset=utf-8") //응답 컨텐츠의 종류 지정
		@ResponseBody //반환 값은 뷰이름이 아니고 응답컨텐츠입니다
		public String writeRecomment(QuestionComment comment) {
		
			questionService.writeRecomment(comment);
			
			return "success"; // WEB-INF/views/success.jsp
		}
		
		@RequestMapping(value = "/comment-list", method = RequestMethod.POST)
		public String commentList(int questionNo, Model model) {
			
			List<QuestionComment> comments = questionService.findCommentListByQuestionNo(questionNo);
			model.addAttribute("comments", comments);
			
			return "question/comments"; // -> /WEB-INF/views/question/comments.jsp를 응답에 사용
		}
		
		@RequestMapping(value = "/delete-comment", method = RequestMethod.GET)
		@ResponseBody
		public String deleteComment(int commentNo) {
			
			questionService.deleteComment(commentNo);
			
			return "success";
		}
		
		@RequestMapping(value = "/update-comment", method = RequestMethod.POST)
		@ResponseBody
		public String updateComment(QuestionComment comment) {
			
			questionService.updateComment(comment);
			
			return "success";
		}
		
		/*----------------------------*/
			
		@RequestMapping(path = "/qacategory", method = RequestMethod.POST)
		public String category(String category, Model model) {

			if(category == null) {
				category = "all";
			}
			
			List<Question> questions = questionService.findQuestionlist(category);
			
			model.addAttribute("questions", questions);		
			return "question/qa-list";
		
		}
		
		
		  @RequestMapping(value = "/coding.do")
		    public String coding() {
		        return "redirect:qa-list";
		    }
		  
		 @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
		    public String insertBoard(String editor) {
		        System.err.println("저장할 내용 : " + editor);
		        return "redirect:/coding.do";
		    }


		
		
	
}
