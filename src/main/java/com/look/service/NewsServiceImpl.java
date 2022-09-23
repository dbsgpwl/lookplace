package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.NewsMapper;
import com.look.model.Criteria;
import com.look.model.NewsDTO;

@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsMapper mapper;

	//게시글 전체 목록 조회
	@Override
	public List<NewsDTO> viewAll() {
		return mapper.viewAll();
	}
	
	/* 게시판 목록(페이징 적용) */
    @Override
    public List<NewsDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    }  
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    }   
	
	//게시글 상세 조회
	@Override
	public NewsDTO viewDetail(int bno) {
	  return mapper.viewDetail(bno);
	}
	
	//조회수 +1
	@Override
	public boolean plusCnt(int bno) {
		return mapper.plusCnt(bno);
	}


	
}
