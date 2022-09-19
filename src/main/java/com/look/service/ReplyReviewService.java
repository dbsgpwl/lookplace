package com.look.service;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.ReplyDTO;

public interface ReplyReviewService {
		// 댓글 조회
		public List<ReplyDTO> replyList(int bno);
		
		// 댓글 작성
		public void replyWrite(ReplyDTO vo);

		// 댓글 삭제
		public void replyDelete(ReplyDTO reply);
		
		// 아이디 체크
		public String idCheck(int rno);
		
		// 댓글 수정
		public void modifyReply(ReplyDTO reply);

}
