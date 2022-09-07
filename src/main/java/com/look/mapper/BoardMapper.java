package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.BoardVO;

public interface BoardMapper {
	/* 작가 등록 */
    public void insert(BoardVO board);
    
    /* 게시판 목록 */
    public List<BoardVO> getList();
    
  

    
   
}
