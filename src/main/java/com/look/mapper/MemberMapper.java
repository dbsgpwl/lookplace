package com.look.mapper;

import javax.inject.Inject;

import com.look.model.MemberDTO;

public interface MemberMapper {
	/* 회원가입 */
	 public void memberJoin(MemberDTO dto);	 
	 
	 /* 아이디 중복 검사 */
	 public int idCheck(String email);
	 
	 public MemberDTO memberLogin(MemberDTO dto);
}
