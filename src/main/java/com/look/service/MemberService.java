package com.look.service;

import com.look.model.MemberDTO;

public interface MemberService {

	void memberJoin(MemberDTO dto);
	
	/* 아이디 중복 검사 */
	public int idCheck(String email) throws Exception;
	
	/* 로그인 */
	public MemberDTO memberLogin(MemberDTO dto) throws Exception;
	
}
