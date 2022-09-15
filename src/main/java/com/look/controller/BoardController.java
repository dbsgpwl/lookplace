package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.BoardDTO;
import com.look.model.Criteria;
import com.look.model.NoticeDTO;
import com.look.model.PageMakerDTO;
import com.look.service.BoardService;
import com.look.service.NoticeService;


@Controller // 해당 클래스를 스프링의 빈으로 인식하도록 하기 위함
@RequestMapping("/board/*") // 
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bservice;
	
	@Autowired
	private NoticeService nservice;

// -------       리뷰                ------------------
	/* 리뷰 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/review")
	public void reviewGET(Model model, Criteria cri) {
		log.info("리뷰 게시판 목록 페이지 진입");

		model.addAttribute("review", bservice.getListPaging(cri));

		int total = bservice.getTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

	}
	
	/* 리뷰 게시글 쓰기 페이지 접속 */
	@GetMapping("/insert-r")
	public void insertRGET() {

		log.info("글쓰기  페이지 진입");

	}

	/* 리뷰 게시글쓰기 */
	@PostMapping("/insert-r")
	public String insertRGET(BoardDTO rdto, RedirectAttributes rttr) {

		log.info("리뷰 글쓰기 페이지 진입");

		log.info("BoardDTO : " + rdto);

		bservice.insert(rdto);

		rttr.addFlashAttribute("result", "등록완료");

		return "redirect:/board/review"; // 등록 완료 후, 목록 페이지로 이동 : 새로고침을 통해 동일한 내용을 계속 서버에 등록할 수 없게 하기 위함!

	}
	
	/* 리뷰 상세 페이지 접속 */
	@GetMapping("/get-r")
	public void getRGET(int bno, Model model, Criteria cri) {

		log.info("리뷰 글상세 페이지 진입");
		model.addAttribute("pageInfo", bservice.getPage(bno));
		model.addAttribute("cri", cri);
	}
	
	 /* 리뷰 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyGET(int bno, Model model, Criteria cri) {
    	log.info("리뷰 수정 페이지 진입");
        model.addAttribute("pageInfo", bservice.getPage(bno));
        model.addAttribute("cri", cri);
    }
    
    /* 리뷰 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr) {
        
        bservice.modify(board);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/review";
        
    }
    
    /* 리뷰 페이지 삭제 */
    @PostMapping("/delete")
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
        
        bservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/board/review";
    }
// --------------------------------------------------------------------------
    /* 게시판 목록 페이지 접속 */
	@GetMapping("/freeboard")
	public void freeboardGET(Model model) {

		log.info("자유게시판 페이지 진입");
		
		model.addAttribute("list", nservice.getList());

	}
	@GetMapping("/notice")
	public void noticeGET() {

		log.info("공지사항 페이지 진입");

	}

	/* 게시글 쓰기 페이지 접속 */
	@GetMapping("/insert-f")
	public void insertFGET() {

		log.info("자유게시판 글쓰기 페이지 진입");

	}
	
	/* 게시판 등록 */
	@PostMapping("/insert-f")
	public String insertFPOST(NoticeDTO dto, RedirectAttributes rttr) {
		log.info("게시판 내용 : " + dto);
		nservice.enroll(dto);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/freeboard";
	}

	/* 게시글 상세 페이지 접속 */
	@GetMapping("/get-f")
	public void getFGET(int bno, Model model) {

		log.info("자유게시판 글상세 페이지 진입");
		model.addAttribute("pageInfo", nservice.getPage(bno));

	}
    
	

	
}
