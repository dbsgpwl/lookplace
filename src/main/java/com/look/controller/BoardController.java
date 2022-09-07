package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.look.service.BoardService;

@Controller					//해당 클래스를 스프링의 빈으로 인식하도록 하기 위함
@RequestMapping("/board/*") // /board로 시작하는 모든 처리를 BoardController에서 하도록 지정하는 역할
public class BoardController {
	 
		private static final Logger log = LoggerFactory.getLogger(BoardController.class);
		
		@Autowired
	    private BoardService bservice;
		
		/* 게시판 목록 페이지 접속 */
		@GetMapping("/review")
		// == @RequestMappign(vlaue="list", method=RequestMethod.GET)
		public void boardListGET(Model model) {
			
			log.info("리뷰 페이지 진입");
			
			model.addAttribute("review", bservice.getList());
		}
		
	
	 
}
