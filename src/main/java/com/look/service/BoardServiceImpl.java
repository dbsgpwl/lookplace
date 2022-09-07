package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.BoardMapper;
import com.look.model.BoardVO;
import com.look.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

//	게시글 등록
	@Override
	public void insert(BoardVO board) {
		
		mapper.insert(board);
		
	}
	
//	게시판 목록 조회
	@Override
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}


	
}
	


    
   
 

