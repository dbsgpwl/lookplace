package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.CommunityReplyMapper;
import com.look.model.CommunityReplyDTO;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	@Autowired
	private CommunityReplyMapper mapper;
	
	//댓글 조회
	@Override
	public List<CommunityReplyDTO> replyList(int bno) {
		return mapper.replyList(bno);
	}
	
	//댓글 작성
	@Override
	public void replyWrite(CommunityReplyDTO vo) {
		mapper.replyWrite(vo);
	}

	//댓글 삭제
	@Override
	public void replyDelete(CommunityReplyDTO reply) {
		mapper.replyDelete(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int rno) {
		return mapper.idCheck(rno);
	}

	// 댓글 수정
	@Override
	public void modifyReply(CommunityReplyDTO reply) {
		mapper.modifyReply(reply);
		
	}



}
