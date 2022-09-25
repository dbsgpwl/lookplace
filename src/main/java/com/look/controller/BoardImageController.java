package com.look.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.Criteria;
import com.look.model.ImageDTO;
import com.look.model.PageMakerDTO;
import com.look.service.ImageService;
import com.look.util.FileUtil;

import static com.look.util.FileUtil.*;

@Controller
public class BoardImageController {

	@Autowired
	private ImageService service;
	String path = "/upload/";

	// 이미지 전체 목록 보기
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String viewAll(Model model, Criteria cri) {

		model.addAttribute("viewAll", service.getListPaging(cri));
		int total = service.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "/board/review";
	}

	// 게시글 상세 조회

	@GetMapping("/getImage")
	public String viewDetail(Model model, @RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);

		// 조회수 +1 service.plusCnt(bno);

		return "/board/r-get";
	}

	// 이미지 등록 페이지 이동
	@GetMapping("/insertImage")
	public String insertImage() {
		return "/board/r-write";
	}

	// 이미지 등록하기
	@PostMapping("/uploadFormAction")
	public String uploadFormPost(ImageDTO vo, Model model, HttpServletRequest request) throws Exception {

		vo.setFilename(FileUtil.upload("/resources/upload", vo.getImagefile(), request));
		service.insertBoard(vo);
		return "redirect:/review";
	}

	// 게시글 삭제

	@GetMapping("/deleteImage")
	public String delete(@RequestParam("bno") int bno) {
		service.deleteImage(bno);

		return "redirect: /review";
	}

}