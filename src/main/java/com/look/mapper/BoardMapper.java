package com.look.mapper;

import java.util.List;

import com.look.model.BoardDTO;
import com.look.model.Criteria;

public interface BoardMapper {
	
    
	/* 게시판 목록 */
    public List<BoardDTO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
    
    /* 게시판 등록 */
    public void insert(BoardDTO rdto);
    
   
}
