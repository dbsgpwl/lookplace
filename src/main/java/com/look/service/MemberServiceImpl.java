package com.look.service;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.MemberMapper;
import com.look.model.MemberDTO;
import com.look.model.TripDTO;
import com.look.model.TripHeartDTO;

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

	@Override
	public MemberDTO findId(MemberDTO dto) {
		
		return mapper.findId(dto);
	}

	@Override
	public MemberDTO findPassword(MemberDTO dto) {
		return mapper.findPassword(dto);
	}

	@Override
	public void updatePassword(MemberDTO dto) {
		mapper.updatePassword(dto);
	}

	@Override
	public List<TripDTO> wishList(String nickname) {
		return mapper.wishList(nickname);
	}

	@Override
	public void unheart(TripHeartDTO dto) {
		mapper.unheart(dto);
	}

	@Override
	public void minusHeart(TripHeartDTO dto) {
		mapper.minusHeart(dto);
	}
	
}

	


    
   
 

