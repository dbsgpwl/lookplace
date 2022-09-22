package com.look.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.look.model.MemberDTO;
import com.look.model.PageMakerDTO;
import com.look.model.CommunityDTO;
import com.look.service.CommunityReplyService;
import com.look.service.CommunityService;


@Controller
public class BoardCommunityController {

	@Autowired
	private CommunityService service;

	@Autowired
	private CommunityReplyService rservice;
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	// 전체 목록 조회
	@RequestMapping("/community")
	public String board(Model model, Criteria cri) {

		model.addAttribute("viewAll", service.getListPaging(cri));

		int total = service.getTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/board/community";
	}

	// 게시글 상세 조회
	@GetMapping("/get-r")
	public String viewDetail(Model model, @RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);

		// 조회수 +1
		service.plusCnt(bno);

		return "/board/c-get";
	}

	// 게시글 작성 페이지 이동
	@GetMapping("write")
	public String boardWrite(HttpServletRequest req, HttpServletResponse res){
		HttpSession session = req.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		if (member == null) {
			try {
				res.sendRedirect("/member/login");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "board/c-write";
	}
	// 게시글 쓰기
	@PostMapping("write")
	public String write(CommunityDTO vo) {
		service.insertBoard(vo);
		return "redirect:/community";
	}


	// 게시글 삭제
	@GetMapping("delete-r")
	public String delete(@RequestParam("bno") int bno) {
		service.deleteBoard(bno);

		return "redirect: /community";
	}

	// 게시글 수정 페이지 이동
	@GetMapping("modify-r")
	public String modify(@RequestParam("bno") int bno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);
		return "board/c-modify";
	}

	@PostMapping("modify-r")
	public String modify(CommunityDTO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.updateBoard(vo);

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect: /get-r?bno=" + vo.getBno();
	}
}
