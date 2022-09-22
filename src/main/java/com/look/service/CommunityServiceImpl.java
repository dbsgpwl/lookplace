package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.CommunityMapper;
import com.look.model.Criteria;
import com.look.model.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityMapper mapper;

	//게시글 전체 목록 조회
	@Override
	public List<CommunityDTO> viewAll() {
		return mapper.viewAll();
	}
	
	/* 게시판 목록(페이징 적용) */
    @Override
    public List<CommunityDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    }  
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal(Criteria cri) {
        
        return mapper.getTotal(cri);
    }   
	
	//게시글 상세 조회
	@Override
	public CommunityDTO viewDetail(int bno) {
	  return mapper.viewDetail(bno);
	}
	
	//조회수 +1
	@Override
	public boolean plusCnt(int bno) {
		return mapper.plusCnt(bno);
	}
	
	//게시물 작성
	@Override
	public int insertBoard(CommunityDTO vo) {
		return mapper.insertBoard(vo);
	}

	//게시물 삭제
	@Override
	public boolean deleteBoard(int bno) {
		return mapper.deleteBoard(bno);
	}
	
	//게시물 수정
	@Override
	public boolean updateBoard(CommunityDTO vo) {
		return mapper.updateBoard(vo);
	}
	
}
