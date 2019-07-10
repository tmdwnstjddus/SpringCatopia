package com.catwebsite.service;

import java.util.List;

import com.catwebsite.common.Util;
import com.catwebsite.repository.MemberRep;
import com.catwebsite.vo.Member;

public class MemberServiceImpl implements MemberService {
	
	private MemberRep memberRep;
	
	public MemberRep getMemberRep() {
		return memberRep;
	}

	public void setMemberRep(MemberRep memberRep) {
		this.memberRep = memberRep;
	}

	@Override
	public void registerMember(Member member) {
		
		String passwd = Util.getHashedString(member.getPasswd(), "SHA-256"); //패스워드 암호화 (복원불가능)
		member.setPasswd(passwd);
		
		memberRep.insertMember(member);
	}

	@Override
	public Member findMemberByIdAndPasswd(String memberId, String passwd) {

		passwd = Util.getHashedString(passwd, "SHA-256"); //암호화
		Member member = memberRep.selectMemberByIdAndPasswd(memberId, passwd);

		return member;
	}

	@Override
	public List<Member> findMemberList() {
		List<Member> members = memberRep.getList();
		return members;
	}
	@Override
	public Member findMemberByMemberId(String memberId) {
		Member member = memberRep.getMemberById(memberId);
		return member;
	}
	@Override
	public void updateMember(Member member) {
		
		
		memberRep.UpdateMember(member);
		
	}
	@Override
	public void updateMemberType(Member member) {
		
		
		memberRep.setType(member);
		
	}

}
