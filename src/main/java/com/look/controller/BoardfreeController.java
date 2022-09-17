package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.look.model.NoticeDTO;
import com.look.service.NoticeService;

@Controller
public class BoardfreeController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private NoticeService nservice;
	
	/* 전체 목록 조회 */
    @RequestMapping("freeboard")
	public String freeboardGET(Model model) {

		log.info("자유게시판 페이지 진입");
		
		model.addAttribute("viewAll", nservice.viewAll());
		return "board/freeboard";
	}
    /* 게시글 상세 조회 */
 	@GetMapping("get-f")
 	public String viewDetail(Model model, 
 	                        @RequestParam("bno")int seq) {
 	  
 	  model.addAttribute("board", nservice.viewDetail(seq));

 	 /* 조회수 */
 	  nservice.plusCnt(seq);
 	  
 	  return "board/get-f";
 	}
 	
	// 게시글 쓰기 페이지 이동
	@GetMapping("insert-f")
	public String boardWrite() {
	  return "board/insert-f";
	}
	
	// 게시글 쓰기
	@PostMapping("insert-f")
	public String write(NoticeDTO vo) {
		nservice.insertBoard(vo);
		/* return "redirect: /get-f?bno="+ vo.getBno();  왜 Bno값이 0으로 넘겨질까?*/
		return "redirect: /freeboard";
	}
	
	// 게시글 삭제
	@GetMapping("delete-f")
	public String delete(@RequestParam("bno")int fbno) {
		nservice.deleteBoard(fbno);
		return "redirect: /freeboard";
	}
	
}
