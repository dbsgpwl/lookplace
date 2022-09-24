package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.ImageDTO;

public interface ImageMapper {
	// 게시글 전체 목록 조회
	public List<ImageDTO> viewAll();

	/* 게시판 목록(페이징 적용) */
	public List<ImageDTO> getListPaging(Criteria cri);

	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);

	// 게시글 상세보기
	public ImageDTO viewDetail(int bno);

	// 조회수 +1
	public boolean plusCnt(int bno);

	// 게시물 작성
	public int insertBoard(ImageDTO vo);

	/*
	 * // 게시물 삭제 public boolean deleteImage(int bno);
	 */
}
