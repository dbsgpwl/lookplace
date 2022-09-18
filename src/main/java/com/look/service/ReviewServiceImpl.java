package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.ReviewMapper;
import com.look.model.Criteria;
import com.look.model.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper mapper;

	//게시글 전체 목록 조회
	@Override
	public List<ReviewDTO> viewAll() {
		return mapper.viewAll();
	}
	
	/* 게시판 목록(페이징 적용) */
    @Override
    public List<ReviewDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    }  
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    }   
	
	//게시글 상세 조회
	@Override
	public ReviewDTO viewDetail(int bno) {
	  return mapper.viewDetail(bno);
	}
	
	//조회수 +1
	@Override
	public boolean plusCnt(int bno) {
	  return mapper.plusCnt(bno);
	}
	
	//게시물 작성
	@Override
	public int insertBoard(ReviewDTO vo) {
		return mapper.insertBoard(vo);
	}

	//게시물 삭제
	@Override
	public boolean deleteBoard(int bno) {
		return mapper.deleteBoard(bno);
	}
	
	//게시물 수정
	@Override
	public boolean updateBoard(ReviewDTO vo) {
		return mapper.updateBoard(vo);
	}
	
}
