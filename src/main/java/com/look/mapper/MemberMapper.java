package com.look.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.look.model.MemberDTO;

@Mapper
public interface MemberMapper {
	/* 회원가입 */
	 public void memberJoin(MemberDTO dto);	 
	 
	 /* 아이디 중복 검사 */
	 public int idCheck(String email);
	 
	 /* 로그인 */
	 public MemberDTO memberLogin(MemberDTO dto);
	 
	/* 회원 정보 수정 */
	 public void memberUpdate(MemberDTO dto);
	 
	 /* 회원 탈퇴 */
	 public void memberDelete(MemberDTO dto);
}
