package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.look.model.Criteria;
import com.look.model.PageMakerDTO;
import com.look.service.CommunityReplyService;
import com.look.service.NewsService;


@Controller
public class BoardNewsController {

	@Autowired
	private NewsService service;

	@Autowired
	private CommunityReplyService rservice;
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	// 전체 목록 조회
	@RequestMapping("/news")
	public String board(Model model, Criteria cri) {

		model.addAttribute("viewAll", service.getListPaging(cri));

		int total = service.getTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/board/news";
	}

	// 게시글 상세 조회
	@GetMapping("/get-n")
	public String viewDetail(Model model, @RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);

		// 조회수 +1
		service.plusCnt(bno);

		return "board/n-get";
	}

	
}
