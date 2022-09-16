package com.look.service;


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
}
	


    
   
 

