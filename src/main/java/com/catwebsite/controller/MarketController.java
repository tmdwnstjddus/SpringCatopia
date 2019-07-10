package com.catwebsite.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.catwebsite.service.MarketService;
import com.catwebsite.view.DownloadView;
import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;
import com.catwebsite.vo.Question;

@Controller
@RequestMapping(path = "/market/")
public class MarketController {

	@Autowired
	@Qualifier("marketService")
	private MarketService marketService;

	@RequestMapping(path = "/mk-list", method = RequestMethod.GET)
	public String list(Model model) {

		// 데이터베이스에서 자료 목록 조회
		List<Market> markets = marketService.findMarketList();

		// 조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
		model.addAttribute("markets", markets);

		return "market/mk-list"; // "/WEB-INF/views/" + upload/list + ".jsp"
	}

	@RequestMapping(path = "/mk-write", method = RequestMethod.GET)
	public String writeForm() {

		return "market/mk-write"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}

	@RequestMapping(path = "/mk-write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest req, Market market) {

		MultipartFile mf = req.getFile("attach");
		if (mf != null) {

			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/upload-files");////////??????????????????

			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) { // iexplore 경우
				// C:\AAA\BBB\CCC.png -> CCC.png
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			String savedFileName = Util.makeUniqueFileName(userFileName);

			try {
				mf.transferTo(new File(path, savedFileName)); // 파일 저장

				MarketFile marketFile = new MarketFile();
				marketFile.setUserFileName(userFileName);
				marketFile.setSavedFileName(savedFileName);
				// uploadFile.setUploadNo(newUploadNo);
				// marketService.registerUploadFile(uploadFile);
				ArrayList<MarketFile> files = new ArrayList<MarketFile>();
				files.add(marketFile);
				market.setFiles(files);

				// 데이터 저장
				marketService.registerMarket(market);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return "redirect:mk-list";
	}

//	@RequestMapping(path = "/mk-detail", method = RequestMethod.GET)
//	public String detail(@RequestParam(name = "uploadno") int mkboardNo, Model model) {
//
//		Market market = marketService.findMarketByMkboardNo(mkboardNo);
//		if (market == null) { // mkboardno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
//			return "redirect:mk-list";
//		}
//		List<MarketFile> files = marketService.findMarketFilesByMkboardNo(mkboardNo);
//		market.setFiles((ArrayList<MarketFile>) files);
//
//		List<MarketComment> comments = marketService.findCommentListByMkboardNo(mkboardNo);
//		market.setComments(comments);
//
//		model.addAttribute("market", market);
//
//		return "upload/mk-detail"; // "/WEB-INF/views/" + upload/detail + ".jsp"
//	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/mk-detail/{mkboardNo}", method = RequestMethod.GET)
	public String detail(@PathVariable int mkboardNo, Model model) {

		Market market = marketService.findMarketByMkboardNo(mkboardNo);
		if (market == null) { // uploadno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
			return "redirect:mk-list";
		}
		List<MarketFile> files = marketService.findMarketFilesByMkboardNo(mkboardNo);
		market.setFiles((ArrayList<MarketFile>) files);

		List<MarketComment> comments = marketService.findCommentListByMkboardNo(mkboardNo);
		market.setComments(comments);

		model.addAttribute("market", market);

		return "market/mk-detail"; // "/WEB-INF/views/" + upload/detail + ".jsp" 
	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/download/{fileNo}", method = RequestMethod.GET)
	public View download(@PathVariable int fileNo, Model model) {

		MarketFile file = marketService.findMarketFileByMarketFileNo(fileNo);
		if (file == null) {
			return new RedirectView("/market/list");
		}

		model.addAttribute("file", file);

		DownloadView v = new DownloadView(); //////???????????????????
		return v;
	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/delete/{mkboardNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int mkboardNo) {

		marketService.deleteMarket(mkboardNo);

		return "redirect:/market/mk-list"; // new RedirectView("/upload/list");
	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/mk-update/{mkboardNo}", method = RequestMethod.GET)
	public String updateForm(@PathVariable int mkboardNo, Model model) {

		Market market = marketService.findMarketByMkboardNo(mkboardNo);
		if (market == null) { // uploadno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
			return "redirect:mk-list";
		}
		List<MarketFile> files = marketService.findMarketFilesByMkboardNo(mkboardNo);
		market.setFiles((ArrayList<MarketFile>) files);

		model.addAttribute("market", market);

		return "market/mk-update";
	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/delete-file/{mkboardNo}/{fileNo}", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody // return 값은 뷰 이름이 아니고 응답컨텐츠
	public String deleteFile(@PathVariable int mkboardNo, @PathVariable int fileNo, Model model) {

		MarketFile file = marketService.findMarketFileByMarketFileNo(fileNo);
		// 파일 삭제
		File f = new File(file.getSavedFileName());
		if (f.exists()) {
			f.delete();
		}
		// 데이터베이스에서 파일 데이터 삭제
		marketService.deleteMarketFile(fileNo);

		return "success";
	}

	// @PathVariable : 요청 경로의 {}부분을 데이터로 읽는 annotation
	@RequestMapping(path = "/mk-update", method = RequestMethod.POST)
	public String updateForm(MultipartHttpServletRequest req, Market market) {

		MultipartFile mf = req.getFile("attach");
		if (mf != null && mf.getOriginalFilename() != null && mf.getOriginalFilename().length() > 0) {

			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/resources/upload-files");///////????????????????

			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) { // iexplore 경우
				// C:\AAA\BBB\CCC.png -> CCC.png
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			String savedFileName = Util.makeUniqueFileName(userFileName);

			try {
				mf.transferTo(new File(path, savedFileName)); // 파일 저장

				// 데이터 저장
				marketService.updateMarket(market);

				MarketFile marketFile = new MarketFile();
				marketFile.setUserFileName(userFileName);
				marketFile.setSavedFileName(savedFileName);
				marketFile.setMkboardNo(market.getMkboardNo());
				marketService.registerMarketFile(marketFile);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return "redirect:/market/mk-detail/" + market.getMkboardNo();//
	}

	/* ================================================================= */

	@RequestMapping(path = "/write-comment", method = RequestMethod.POST, produces = "text/plain;charset=utf-8") // 응답
																													// 컨텐츠의
																													// 종류
																													// 지정
	@ResponseBody // 반환 값은 뷰이름이 아니고 응답컨텐츠입니다
	public String writeComment(MarketComment comment) {

		marketService.writeComment(comment);

		return "success"; // WEB-INF/views/success.jsp
	}

	@RequestMapping(path = "/write-recomment", method = RequestMethod.POST, produces = "text/plain;charset=utf-8") // 응답
																													// 컨텐츠의
																													// 종류
																													// 지정
	@ResponseBody // 반환 값은 뷰이름이 아니고 응답컨텐츠입니다
	public String writeRecomment(MarketComment comment) {

		marketService.writeRecomment(comment);

		return "success"; // WEB-INF/views/success.jsp
	}

	@RequestMapping(value = "/comment-list", method = RequestMethod.POST)
	public String commentList(int mkboardNo, Model model) {

		List<MarketComment> comments = marketService.findCommentListByMkboardNo(mkboardNo);
		model.addAttribute("comments", comments);

		return "market/mk-comments"; // -> /WEB-INF/views/upload/commnets.jsp를 응답에 사용
	}

	@RequestMapping(value = "/delete-comment", method = RequestMethod.GET)
	@ResponseBody
	public String deleteComment(int commentNo) {

		marketService.deleteComment(commentNo);

		return "success";
	}

	@RequestMapping(value = "/update-comment", method = RequestMethod.POST)
	@ResponseBody
	public String updateComment(MarketComment comment) {

		marketService.updateComment(comment);

		return "success";
	}
	
	/*----------------------------*/
	
	@RequestMapping(path = "/marketcategory", method = RequestMethod.POST)
	public String category(String category, Model model) {

		if(category == null) {
			category = "all";
		}
		
		List<Market> markets = marketService.findMarketlist(category);
		
		model.addAttribute("markets", markets);		
		return "market/mk-list";
	
	}
}
