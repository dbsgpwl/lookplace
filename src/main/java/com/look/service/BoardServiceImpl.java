package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.BoardMapper;
import com.look.model.BoardDTO;
import com.look.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	//게시판 글 등록
	@Override
	public void insert(BoardDTO rdto) {
		mapper.insert(rdto);
			
	}
	
    //게시판 목록 조회
	@Override
	public List<BoardDTO> getList() {
		
		return mapper.getList();
	}


	
	
	/* 게시판 목록(페이징 적용) */
    @Override
    public List<BoardDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    }    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    }





	
}
	


    
   
 

