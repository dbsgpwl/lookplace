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
	
	/* 게시물 등록 */
	@Override
	public void enroll(NoticeDTO dto) {
		mapper.enroll(dto);
	}
	
	/* 게시판 목록 조회 */
	@Override
	public List<NoticeDTO> getList() {
		return mapper.getList();
	}
	/* 게시글 상세 조회 */
	@Override
	public NoticeDTO getPage(int bno) {
		return mapper.getPage(bno);
	}

}
