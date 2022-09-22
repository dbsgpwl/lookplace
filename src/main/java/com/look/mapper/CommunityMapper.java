package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.CommunityDTO;


public interface CommunityMapper {
	
	//게시글 전체 목록 조회
	public List<CommunityDTO> viewAll();
	
	/* 게시판 목록(페이징 적용) */
    public List<CommunityDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
	
	// 게시글 상세보기
	public CommunityDTO viewDetail(int bno);
	
	// 조회수 +1
	public boolean plusCnt(int bno);
	
	// 게시물 작성
	public int insertBoard(CommunityDTO vo);
	
	// 게시물 삭제
	public boolean deleteBoard(int bno);
	
	// 게시물 수정
	public boolean updateBoard(CommunityDTO vo);
	
	
	
}
