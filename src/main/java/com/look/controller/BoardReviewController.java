package com.look.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.Criteria;
import com.look.model.PageMakerDTO;
import com.look.model.ReplyDTO;
import com.look.model.ReviewDTO;
import com.look.service.ReplyReviewService;
import com.look.service.ReviewService;

@Controller
public class BoardReviewController {

	@Autowired
	private ReviewService service;
	
	@Autowired
	private ReplyReviewService rservice;
	
	// 전체 목록 조회
	@RequestMapping("/review")
	public String board(Model model,Criteria cri) {
		
		model.addAttribute("viewAll", service.getListPaging(cri));
		
		int total=service.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/board/review";
	}
	
	// 게시글 상세 조회
	@GetMapping("/get-r")
	public String viewDetail(Model model, 
	                        @RequestParam("bno")int bno, @ModelAttribute("cri") Criteria cri) {
	  
	  model.addAttribute("board", service.viewDetail(bno));
	  model.addAttribute("cri", cri);

	  //조회수 +1
	  service.plusCnt(bno);
	  
	 //댓글 조회
	  List<ReplyDTO> reply = rservice.replyList(bno);
	  model.addAttribute("reply", reply);
	  
	  return "/board/get";
	}
	
	//게시글 작성 페이지 이동
	@GetMapping("write")
	public String boardWrite() {
	  return "board/write";
	}
	
	//게시글 작성
	@PostMapping("write")
	public String write(ReviewDTO vo) {
		service.insertBoard(vo);
		return "redirect:/review";
	}
	
	//게시글 삭제
	@GetMapping("delete-r")
	public String delete(@RequestParam("bno")int bno) {
		service.deleteBoard(bno);
		
		return "redirect: /review";
	}
	
	//게시글 수정 페이지 이동
	@GetMapping("modify-r")
	public String modify(@RequestParam("bno")int bno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);
		return "board/modify";
	}

	@PostMapping("modify-r")
	public String modify(ReviewDTO vo,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.updateBoard(vo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		return "redirect: /get-r?bno="+ vo.getBno();
	}
}
