package com.look.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.AttachImageDTO;
import com.look.model.Criteria;
import com.look.model.MemberDTO;
import com.look.model.PageMakerDTO;
import com.look.model.ReviewDTO;
import com.look.service.ReplyReviewService;
import com.look.service.ReviewService;

import net.coobird.thumbnailator.Thumbnails;

@SuppressWarnings("deprecation")
@Controller
public class BoardReviewController {

	@Autowired
	private ReviewService service;

	@Autowired
	private ReplyReviewService rservice;
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	// 전체 목록 조회
	@RequestMapping("/review")
	public String board(Model model, Criteria cri) {

		model.addAttribute("viewAll", service.getListPaging(cri));

		int total = service.getTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/board/review";
	}

	// 게시글 상세 조회
	@GetMapping("/get-r")
	public String viewDetail(Model model, @RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);

		// 조회수 +1
		service.plusCnt(bno);

		return "/board/get";
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("c:\\upload\\review\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시글 작성 페이지 이동
	@GetMapping("write")
	public String boardWrite(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		if (member == null) {
			res.sendRedirect("/member/login");
		}
		return "board/write";
	}

	// 게시글 작성
	@PostMapping("write")
	public String write(ReviewDTO vo) {

		service.insertBoard(vo);
		return "redirect:/review";
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageDTO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		log.info("uploadAjaxActionPOST..........");
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
				if(!type.startsWith("image")) {
				
					List<AttachImageDTO> list = null;
					return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
		}//for
		
		String uploadFolder = "C:\\upload\\review";

		/* 날짜 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* 이미지 정보 담는 객체 */
		List<AttachImageDTO> list = new ArrayList();
		/* 이미지 정보 담는 객체 */
		AttachImageDTO vo = new AttachImageDTO();
		for (MultipartFile multipartFile : uploadFile) {
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				/* 썸네일 생성 */
				/*
				 * File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile); 비율 double ratio = 3; 넓이 높이
				 * int width = (int) (bo_image.getWidth() / ratio); int height = (int)
				 * (bo_image.getHeight() / ratio); BufferedImage bt_image = new
				 * BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0,width,height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}//for
		ResponseEntity<List<AttachImageDTO>> result = new ResponseEntity<List<AttachImageDTO>>(list, HttpStatus.OK);

		return result;
	}

	// 게시글 삭제
	@GetMapping("delete-r")
	public String delete(@RequestParam("bno") int bno) {
		service.deleteBoard(bno);

		return "redirect: /review";
	}

	// 게시글 수정 페이지 이동
	@GetMapping("modify-r")
	public String modify(@RequestParam("bno") int bno, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.viewDetail(bno));
		model.addAttribute("cri", cri);
		return "board/modify";
	}

	@PostMapping("modify-r")
	public String modify(ReviewDTO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.updateBoard(vo);

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect: /get-r?bno=" + vo.getBno();
	}
}
