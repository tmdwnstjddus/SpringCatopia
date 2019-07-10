package com.catwebsite.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catwebsite.service.MemberService;
import com.catwebsite.vo.Member;

@Controller
@RequestMapping(path = "/account/")
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(path = "register", method = RequestMethod.GET)
	public String showRegisterForm() {
		
		return "account/register"; // /WEB-INF/views/account/register.jsp
		
	}
	
	@RequestMapping(path = "register", method = RequestMethod.POST)
	public String register(Member member, String confirm) {
		
		if (!member.getPasswd().equals(confirm)) {
			return "redirect:/account/register";
		}
		
//		String passwd = Util.getHashedString(member.getPasswd(), "SHA-256"); //패스워드 암호화 (복원불가능)
//		member.setPasswd(passwd);
		
		memberService.registerMember(member);
		
		return "redirect:/account/login";
		
	}
	
	@RequestMapping(path = "login", method = RequestMethod.GET)
	public String showLoginForm() {
		
		return "account/login"; // /WEB-INF/views/account/login.jsp
		
	}
	
	@RequestMapping(path = "login", method = RequestMethod.POST)
	public String login(String memberId, String passwd, HttpSession session) {
		
		//passwd = Util.getHashedString(passwd, "SHA-256"); //암호화
		
		//2. 로그인 가능 여부 확인
		Member member = memberService.findMemberByIdAndPasswd(memberId, passwd);
		
		//3. 로그인 성공 또는 실패 처리
		if (member != null) { //로그인 가능 -> 로그인 처리 : 세션에 로그인 데이터 저장
			session.setAttribute("loginuser", member); //로그인 처리
			return "redirect:/home"; 			
		} else { //로그인 실패
			return "account/login";			
		}
		
	}
	
	@RequestMapping(path = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/home";
		
	}

}








