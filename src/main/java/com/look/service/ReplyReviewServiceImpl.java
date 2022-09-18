package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.ReplyReviewMapper;
import com.look.model.ReplyDTO;

@Service
public class ReplyReviewServiceImpl implements ReplyReviewService {
	@Autowired
	private ReplyReviewMapper mapper;
	
	@Override
	public List<ReplyDTO> replyList(int bno) {
		return mapper.replyList(bno);
	}

	@Override
	public void replyWrite(ReplyDTO vo) {
		mapper.replyWrite(vo);
	}

	@Override
	public void replyModify(ReplyDTO vo) {
		mapper.replyModify(vo);
	}

	@Override
	public void replyDelete(ReplyDTO vo) {
		mapper.replyDelete(vo);
	}

}
