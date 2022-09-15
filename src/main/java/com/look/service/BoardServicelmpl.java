package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.BoardMapper;
import com.look.model.Criteria;
import com.look.model.BoardDTO;

@Service
public class BoardServicelmpl implements BoardService{
	
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

    /* 게시판 조회 */
    @Override
    public BoardDTO getPage(int bno) {
         
        return mapper.getPage(bno);
    }    


    /* 게시판 수정 */
    @Override
    public int modify(BoardDTO board) {
        
        return mapper.modify(board);
    }
    
    /* 게시판 삭제 */
    @Override
    public int delete(int bno) {
        
        return mapper.delete(bno);
    }    
	
}
	


    
   
 

