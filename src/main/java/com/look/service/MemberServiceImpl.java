package com.look.service;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.MemberMapper;
import com.look.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void memberJoin(MemberDTO dto) {
		mapper.memberJoin(dto);	
	}

	@Override
	public int idCheck(String email) throws Exception {
		return mapper.idCheck(email);
	}

	@Override
	public MemberDTO memberLogin(MemberDTO dto) throws Exception {
		return mapper.memberLogin(dto);
	}

	@Override
	public void memberUpdate(MemberDTO dto) throws Exception {
		mapper.memberUpdate(dto);
		
	}

	@Override
	public void memberDelete(MemberDTO dto) throws Exception {
		mapper.memberDelete(dto);
		
	}

}

	


    
   
 

