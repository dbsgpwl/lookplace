package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.TripDTO;
import com.look.model.TripHeartDTO;
import com.look.model.TripReplyDTO;

public interface TripMapper {
	
	//여행 목록
	public List<TripDTO> getList();

	//지역 페에지 목록
	public List<TripDTO> locationList(Criteria cri);	
	
	//게시물 개수
	public int localTotal();
	//게시물 목록(페이징)
	public List<TripDTO> localListPaging(Criteria cri);
	
	//상세페이지 조회
	public TripDTO Detailpage(int imgno);
	//조회수 증가
	public int updateCount(int imgno);
	//상세페이지 댓글 조회
	public List<TripReplyDTO> replyList(int imgno);
	
	//댓글 
	public void insertList(TripReplyDTO dto);
	
	//댓글 삭제	
	public int deleteReply(int reno);
	
	//댓글 수정
	public void	updateReply(TripReplyDTO dto);
	
	//좋아요 
	public void insertHeart(TripHeartDTO dto);
	
	//닉네임이 좋아요한 게시물 유무 확인
	public List<TripHeartDTO> nickCheck(TripHeartDTO dto);
	
	
}
