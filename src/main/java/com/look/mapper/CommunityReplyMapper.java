package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.CommunityReplyDTO;

public interface CommunityReplyMapper {
	// 댓글 조회
	public List<CommunityReplyDTO> replyList(int bno);
	
	// 댓글 작성
	public void replyWrite(CommunityReplyDTO vo);
	
	// 댓글 삭제
	public void replyDelete(CommunityReplyDTO reply);
	
	// 아이디 체크
	public String idCheck(int rno);
	
	// 댓글 수정
	public void modifyReply(CommunityReplyDTO reply);

}
