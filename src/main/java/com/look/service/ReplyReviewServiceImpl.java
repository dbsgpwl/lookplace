package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.ReplyReviewMapper;
import com.look.model.Criteria;
import com.look.model.PageMakerDTO;
import com.look.model.ReplyDTO;

@Service
public class ReplyReviewServiceImpl implements ReplyReviewService {
	@Autowired
	private ReplyReviewMapper mapper;
	
	//댓글 조회
	@Override
	public List<ReplyDTO> replyList(int bno) {
		return mapper.replyList(bno);
	}
	
	//댓글 작성
	@Override
	public void replyWrite(ReplyDTO vo) {
		mapper.replyWrite(vo);
	}

	//댓글 삭제
	@Override
	public void replyDelete(ReplyDTO reply) {
		mapper.replyDelete(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int rno) {
		return mapper.idCheck(rno);
	}

	// 댓글 수정
	@Override
	public void modifyReply(ReplyDTO reply) {
		mapper.modifyReply(reply);
		
	}



}
