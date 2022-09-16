package com.look.service;

import java.util.List;

import com.look.model.NoticeDTO;

public interface NoticeService {
	/* 게시판 등록 */
    public void enroll(NoticeDTO dto);
    
    /* 게시판 목록 */
    public List<NoticeDTO> getList();
    
    /* 게시판 조회 */
    public NoticeDTO getPage(int bno);
    
    /* 게시판 수정 */
    public int update(NoticeDTO dto);
}
