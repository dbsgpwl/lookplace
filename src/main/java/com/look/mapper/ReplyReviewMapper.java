package com.look.mapper;

import java.util.List;

import com.look.model.ReplyDTO;

public interface ReplyReviewMapper {
	// 댓글 조회
	public List<ReplyDTO> replyList(int bno);

	// 댓글 작성
	public void replyWrite(ReplyDTO vo);

	// 댓글 수정
	public void replyModify(ReplyDTO vo);

	// 댓글 삭제
	public void replyDelete(ReplyDTO vo);
}