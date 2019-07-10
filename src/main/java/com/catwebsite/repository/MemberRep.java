package com.catwebsite.repository;
import java.util.ArrayList;
import com.catwebsite.vo.Member;

public interface MemberRep {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(String id, String passwd);
	
	ArrayList<Member> getList();
	
	Member getMemberById(String memberId);
	
	void UpdateMember(Member member);
	
	void setType(Member member);
}