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
}
	


    
   
 

