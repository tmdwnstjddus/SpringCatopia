package com.catwebsite.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.catwebsite.common.Util;
import com.catwebsite.service.MemberService;
import com.catwebsite.vo.Member;

@Controller
@RequestMapping(path = "/member/")
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(path = "/memberlist", method = RequestMethod.GET)
	public String memberList(Model model) {
		
		List<Member> members = memberService.findMemberList();
		
		//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
		model.addAttribute("members", members);
		return "member/memberlist"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	@RequestMapping(path = "/memberview", method = RequestMethod.GET)
	public String memberView(@RequestParam(name="memberId") String memberId, Model model) {
		Member member = memberService.findMemberByMemberId(memberId);
		model.addAttribute("member",member);
		return "member/memberview"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	@RequestMapping(path = "/membermypage", method = RequestMethod.GET)
	public String memberMyPage(@RequestParam(name="memberId") String memberId, Model model) {
		Member member = memberService.findMemberByMemberId(memberId);
		model.addAttribute("member",member);
		return "member/membermypage"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
		
	@RequestMapping(path = "/memberset", method = RequestMethod.GET)
	public String memberSetForm(@RequestParam(name="memberId") String memberId, Model model) {
		Member member = memberService.findMemberByMemberId(memberId);
		model.addAttribute("member",member);
		return "member/memberset"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	
	
	@RequestMapping(path = "/memberset", method = RequestMethod.POST)
	public String memberSet(HttpServletRequest req, Member member) {
		
		String memberId = req.getParameter("memberId");
		String passwd = req.getParameter("passwd");
		String confirm = req.getParameter("confirm");
		
		if (!passwd.equals(confirm)) {
			return "redirect:/member/memberset?memberId="+memberId;
		}	
		passwd = Util.getHashedString(passwd, "SHA-256");
		String email = req.getParameter("email");
		
		member.setMemberId(memberId);
		member.setPasswd(passwd);
		member.setEmail(email);
		memberService.updateMember(member);
		
		return "redirect:/member/membermypage?memberId="+memberId; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	@RequestMapping(path = "/membertypeset", method = RequestMethod.GET)
	public String membertypeSetForm(@RequestParam(name="memberId") String memberId, Model model) {
		Member member = memberService.findMemberByMemberId(memberId);
		model.addAttribute("member",member);
		return "member/membertypeset"; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	@RequestMapping(path = "/membertypeset", method = RequestMethod.POST)
	public String membertypeSet(HttpServletRequest req, Member member) {
		
		String memberId = req.getParameter("memberId");
		String usertype = req.getParameter("userType");
		
		member.setMemberId(memberId);
		member.setUserType(usertype);
		
		memberService.updateMemberType(member);
		
		return "redirect:/member/memberview?memberId="+memberId; // "/WEB-INF/views/" + upload/write + ".jsp"
	}
	
	
}



















