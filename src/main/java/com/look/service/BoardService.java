package com.look.service;

import java.util.List;

import com.look.model.BoardDTO;
import com.look.model.Criteria;

public interface BoardService {
	
    
	
    /* 게시판 등록 */
    public void insert(BoardDTO rdto);

    /* 게시판 목록 조회 */
    public List<BoardDTO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
}
