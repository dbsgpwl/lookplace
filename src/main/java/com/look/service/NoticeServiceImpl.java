package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.NoticeMapper;
import com.look.model.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper mapper;

	//게시물 전체 목록 조회
	@Override
	public List<NoticeDTO> viewAll() {
		return mapper.viewAll();
				
	}
	
	//게시글 상세 조회
	@Override
	public NoticeDTO viewDetail(int seq) {
		return mapper.viewDetail(seq);
	}

	//조회수+1
	@Override
	public boolean plusCnt(int seq) {
		return mapper.plusCnt(seq);
	}
	

}
