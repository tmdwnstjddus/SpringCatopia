package com.catwebsite.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.catwebsite.common.Util;
import com.catwebsite.service.ReviewService;
import com.catwebsite.view.DownloadView;
import com.catwebsite.vo.QuestionComment;
import com.catwebsite.vo.Review;
import com.catwebsite.vo.ReviewComment;
import com.catwebsite.vo.ReviewFile;
@Controller
@RequestMapping(path = "/re-upload")
public class ReviewController {

	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;
	
	@RequestMapping(path = "/re-list", method = RequestMethod.GET)
	public String list(Model model) {
		
		ArrayList<Review> review = reviewService.findReviews();
		
		model.addAttribute("review", review);
		
		return "upload/re-list"; 
	}
	
	@RequestMapping(path = "/viewcategory", method = RequestMethod.POST)
	public String category(String category, Model model) {

		if(category == null) {
			category = "all";
		}
		
		List<Review> review = reviewService.findReviewlist(category);
		System.out.println(category);
		model.addAttribute("review", review);		
		return "upload/re-list";
	
	}
	
	@RequestMapping(path="/re-write", method = RequestMethod.GET)
	public String writeForm() {
		
		return "upload/re-write"; 
	}
	
	@RequestMapping(path="/re-write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest req, Review review, Model model) {
		
		MultipartFile mf = req.getFile("attach");
		if(mf != null) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/upload-files");
			
			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) {
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			
			String savedFileName = Util.makeUniqueFileName(userFileName);
			
			try {
				mf.transferTo(new File(path, savedFileName));
											
				ReviewFile reviewFile = new ReviewFile();
				reviewFile.setUserFileName(userFileName);
				reviewFile.setSavedFileName(savedFileName);
				ArrayList<ReviewFile> files = new ArrayList<ReviewFile>();
				files.add(reviewFile);
				review.setFiles(files);
				System.out.println(review);
				reviewService.registerReview(review);
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
		}
		model.addAttribute("review",review);
		
		return "redirect:coding.do";  //상대경로
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
//		return "upload/qa-detail";
//	}
	
	
	@RequestMapping(path="/re-detail/{reviewNo}", method = RequestMethod.GET)
	public String detail2(@PathVariable int reviewNo, Model model) {
		
	      
		Review review = reviewService.findReviewByReviewNo(reviewNo);
	      if (review == null) {

	         return "redirect:re-list";
	      }
	      
	      List<ReviewFile> files = reviewService.findReviewFilesByReviewNo(reviewNo);
	      review.setFiles((ArrayList<ReviewFile>)files); 
	      
	      reviewService.readCount(reviewNo);
	      
	    
	      model.addAttribute("review", review);
		
		return "upload/re-detail"; 
	}
	
	@RequestMapping(path="/download/{fileNo}", method = RequestMethod.GET)
	public View download(@PathVariable int fileNo, Model model) {
    
		
	      
		  ReviewFile file = reviewService.findReviewFileByReviewFileNo(fileNo);
	      if (file == null) { 
	         
	    	  return new RedirectView("/upload/re-list");
	      }
	      
	      model.addAttribute("file",file); //View 객체로 전달할 데이터 저장(Request에 저장)
	      
	      DownloadView v = new DownloadView();
	      return v;
	    
	}
	
	@RequestMapping(path="/delete/{reviewNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int reviewNo) {
	      
		reviewService.deleteReview(reviewNo);
	          
	      return "redirect:/re-upload/re-list"; 
	    
	}
	
	//@PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
		@RequestMapping(path = "/re-update/{reviewNo}", method = RequestMethod.GET)
		public String updateForm(@PathVariable  int reviewNo, Model model) {

			
			
			Review review = reviewService.findReviewByReviewNo(reviewNo);
			if (review == null) { //uploadno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
				return "redirect:/upload/re-list";
			}		
			List<ReviewFile> files = reviewService.findReviewFilesByReviewNo(reviewNo);
			review.setFiles((ArrayList<ReviewFile>)files); //Upload : UploadFile == 1 : Many
			 
			
			
			//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
			model.addAttribute("review", review);

			
			return "upload/re-update";
		}
		
		//@PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
		@RequestMapping(path = "/delete-file/{reviewNo}/{fileNo}", method = RequestMethod.GET)
		public String deleteFile(
				@PathVariable int reviewNo, @PathVariable int fileNo, Model model) {
			
			ReviewFile file = reviewService.findReviewFileByReviewFileNo(fileNo);
			
			//파일 삭제
			File f = new File(file.getSavedFileName());
			if (f.exists()) {
				f.delete();
			}		
			//데이터베이스에서 파일 데이터 삭제		
			reviewService.deleteReviewFile(fileNo);

			
			return "redirect:/re-upload/re-update/" + reviewNo;
		}
		
		@RequestMapping(path = "/re-update", method = RequestMethod.POST)
		public String update(MultipartHttpServletRequest req, Review review) {

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
				
					ReviewFile reviewFile = new ReviewFile();
					reviewFile.setUserFileName(userFileName);
					reviewFile.setSavedFileName(savedFileName);
					reviewFile.setReviewNo(review.getReviewNo());
					reviewService.registerReviewFile(reviewFile);
					
					//데이터 저장
					reviewService.updateReview(review);
					
				}catch(Exception ex) {
					ex.printStackTrace();
				}
				
			}

			
			return "redirect:/re-upload/re-detail/" + review.getReviewNo();
		}
		
		@RequestMapping(path = "/write-comment", 
				method = RequestMethod.POST, 
				produces = "text/plain;charset=utf-8") //응답 컨텐츠의 종류 지정
@ResponseBody //반환 값은 뷰이름이 아니고 응답컨텐츠입니다
public String writeComment(ReviewComment comment) {
	
			reviewService.writeComment(comment);
	
	
	return "success"; // WEB-INF/views/success.jsp
}

@RequestMapping(path = "/write-recomment", 
		method = RequestMethod.POST, 
		produces = "text/plain;charset=utf-8") //응답 컨텐츠의 종류 지정
@ResponseBody //반환 값은 뷰이름이 아니고 응답컨텐츠입니다
public String writeRecomment(ReviewComment comment) {

	reviewService.writeRecomment(comment);
	
	return "success"; // WEB-INF/views/success.jsp
}

@RequestMapping(value = "/comment-list", method = RequestMethod.POST)
public String commentList(int reviewNo, Model model) {
	
	List<ReviewComment> comments = reviewService.findCommentListByReviewNo(reviewNo);
	model.addAttribute("comments", comments);
	
	return "upload/comments"; // -> /WEB-INF/views/upload/comments.jsp를 응답에 사용
}

@RequestMapping(value = "/delete-comment", method = RequestMethod.GET)
@ResponseBody
public String deleteComment(int commentNo) {
	
	reviewService.deleteComment(commentNo);
	
	return "success";
}

@RequestMapping(value = "/update-comment", method = RequestMethod.POST)
@ResponseBody
public String updateComment(ReviewComment comment) {
	
	reviewService.updateComment(comment);
	
	return "success";
}
@RequestMapping(value = "/coding.do")
public String coding() {
    return "redirect:re-list";
}

@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
public String insertBoard(String editor) {
    System.err.println("저장할 내용 : " + editor);
    return "redirect:/coding.do";
}
		
}
