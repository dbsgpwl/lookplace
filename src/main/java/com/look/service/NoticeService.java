package com.look.service;

import java.util.List;

import com.look.model.NoticeDTO;

public interface NoticeService {
	// 게시글 전체 목록 조회
	public List<NoticeDTO> viewAll();
	
	// 게시글 상세보기
	public NoticeDTO viewDetail(int seq);
	
	// 조회수 +1
	public boolean plusCnt(int seq);
}
