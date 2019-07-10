package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.catwebsite.mapper.MemberMapper;
import com.catwebsite.vo.Member;

public class MemberRepImpl implements MemberRep {
	
	private SqlSessionTemplate sessionTemplate;
	
	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	private MemberMapper memberMapper;
		
	public MemberMapper getMemberMapper() {
		return memberMapper;
	}

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public void insertMember(Member member) {
		
		memberMapper.insertMember(member);
		
	}
	
	@Override
	public Member selectMemberByIdAndPasswd(String id, String passwd) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", id);
		params.put("passwd", passwd);
		
		Member member = memberMapper.selectMemberByIdAndPasswd(params);
		
		return member;
	
	}
	
	@Override
	public ArrayList<Member> getList() {
		
		ArrayList<Member> members = memberMapper.getList();
		
		return (ArrayList<Member>)members;
		
	}
	@Override
	public Member getMemberById(String memberId) {
		Member member = memberMapper.getMemberById(memberId);
		return member;
	}
	@Override
	public void UpdateMember(Member member) {
		
		memberMapper.UpdateMember(member);
	}
	@Override
	public void setType(Member member) {
		memberMapper.setType(member);
		
	}
}




















