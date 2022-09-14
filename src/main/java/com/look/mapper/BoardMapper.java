package com.look.mapper;

import java.util.List;

import com.look.model.BoardDTO;
import com.look.model.Criteria;

public interface BoardMapper {
	
    
<<<<<<< HEAD
    /* 게시판 목록 */
    public List<BoardVO> getList();

=======
	/* 게시판 목록 */
    public List<BoardDTO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);
    
    /* 게시판 등록 */
    public void insert(BoardDTO rdto);
    
    /* 게시판 조회 */
    public BoardDTO getPage(int bno);
    
    /* 게시판 수정 */
    public int modify(BoardDTO board);
    
    /* 게시판 삭제 */
    public int delete(int bno);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
>>>>>>> 6754d072c29ba3806eebbbfb791425215dc116df
}
