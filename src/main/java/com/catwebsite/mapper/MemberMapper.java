package com.catwebsite.mapper;

import java.util.HashMap;
import java.util.ArrayList;
import com.catwebsite.vo.Member;

//이 인터페이스의 패키지와 인터페이스 이름은 member-mapper.xml 파일의 namespace와 일치
public interface MemberMapper {
	
	void insertMember(Member member);
	
	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
	
	ArrayList<Member> getList();
	
	Member getMemberById(String memberId);
	
	void UpdateMember(Member member);
	
	void setType(Member member);
}
