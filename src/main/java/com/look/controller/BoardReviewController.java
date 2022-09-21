package com.look.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.Criteria;
import com.look.model.MemberDTO;
import com.look.model.PageMakerDTO;
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
	  
	  return "/board/get";
	}
	
	//게시글 작성 페이지 이동
	@GetMapping("write")
	public String boardWrite(HttpServletRequest req, HttpServletResponse res) throws IOException {
		 HttpSession session = req.getSession();
		 MemberDTO member = (MemberDTO)session.getAttribute("member");
	
		if(member == null) {
			   res.sendRedirect("/member/login");
			} 
	  return "board/write";
	}
	
	//게시글 작성
	@PostMapping("write")
	public String write(ReviewDTO vo) {
		
		/*
		 * MemberDTO member = (MemberDTO)session.getAttribute("member");
		 * vo.setNickname(member.getNickname()); //파일을 저장하는 폴더 위치 -> 서버와 상관이 없는 위치
		 * String uploadFolder = "c:\\upload\\review"; File forder = new
		 * File(uploadFolder); if(!forder.exists()) forder.mkdirs();
		 * 
		 * for(MultipartFile multipartFile : uploadFile) { String fileName =
		 * multipartFile.getOriginalFilename();
		 * 
		 * }
		 */
		
	     
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
