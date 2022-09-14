package com.look.service;

import java.util.List;

import com.look.model.BoardVO;

public interface BoardService {
	/* 게시판 등록 */
    public void insert(BoardVO board);
    
    /* 게시판 목록 조회 */
    public List<BoardVO> getList();

}
