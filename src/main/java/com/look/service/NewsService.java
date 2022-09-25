package com.look.service;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.NewsDTO;

public interface NewsService {
	
		//게시글 전체 목록 조회
		public List<NewsDTO> viewAll();
		
		/* 게시판 목록(페이징 적용) */
	    public List<NewsDTO> getListPaging(Criteria cri);
	    
	    /* 게시판 총 갯수 */
	    public int getTotal(Criteria cri);
		
		// 게시글 상세보기
		public NewsDTO viewDetail(int bno);
		
		// 조회수 +1
		public boolean plusCnt(int bno);

		
}

