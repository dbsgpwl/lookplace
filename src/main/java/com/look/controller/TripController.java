package com.look.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.look.model.Criteria;
import com.look.model.PageMakerDTO;
import com.look.model.TripDTO;
import com.look.model.TripHeartDTO;
import com.look.model.TripReplyDTO;
import com.look.service.TripService;

import lombok.AllArgsConstructor;



@Controller					
@RequestMapping("/trip/*") 
@AllArgsConstructor
public class TripController {
	 
		private static final Logger log = LoggerFactory.getLogger(TripController.class);
		
		private TripService service;
		

//		@GetMapping("/area")
//		public void areaGET(Criteria cri, Model model) {
//			model.addAttribute("trip", service.locationList(cri));
//		}
		

		@GetMapping("/mapapi")
		public void mapGET(Model model) {

			
			log.info("지도 페이지 진입");			
		}
		
		/* top10 목록 페이지 접속  */

		@GetMapping("/best")
		public void bestGET(Model model) {
			model.addAttribute("list", service.getList());
			log.info("인기 페이지 진입");		
		}		
		
		/* 전체/지역 목록 페이지 접속  */
		@GetMapping("/entire")
		public void entireGET(Criteria cri, Model model, TripHeartDTO dto) {
			model.addAttribute("trip", service.localListPaging(cri));
			model.addAttribute("key", cri.getKeyword());
			model.addAttribute("nickCheck",service.nickCheck(dto));
			
			System.out.println(dto);
			
			/*페이징 처리*/
			int total = service.localTotal();
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
			log.info("전체 페이지 진입");			
		}
		
		//게시물 좋아요 기능
		@PostMapping("/heart")
		public String heart(@RequestParam("keyword")String keyword, TripHeartDTO dto,Model model) throws UnsupportedEncodingException{
			
			String encodedParam = URLEncoder.encode(keyword, "UTF-8");
			
			return "redirect:/trip/entire?keyword=" +encodedParam;
		}
		
		//게시물 좋아요 취소
		@PostMapping("/unheart")
		public String unheart(TripHeartDTO dto,@RequestParam("keyword")String keyword) throws UnsupportedEncodingException{
			String encodedParam = URLEncoder.encode(keyword, "UTF-8");
			
			service.nickCheck(dto);
				
			
			return "redirect:/trip/entire?keyword=" +encodedParam;
		}
		
		
		@GetMapping("/travel-p")
		public void detailGET( Model model, @RequestParam("imgno")int imgno, Criteria cri, TripDTO dto) {
			log.info("상세페이지 진입");
			
			service.updateCount(imgno);
			
			model.addAttribute("re" , dto);
			model.addAttribute("reply", service.replyList(imgno));
			model.addAttribute("detail", service.Detailpage(imgno));
			model.addAttribute("cri", cri);
			
			
		}
		// 댓글 작성
		@PostMapping("/travel-p")
		public String write(TripReplyDTO dto, @RequestParam("imgno")int imgno) {
			service.insertList(dto);
			return "redirect:/trip/travel-p?imgno=" +imgno;
		}
		
		//댓글 삭제
		@PostMapping("/delete")
		public String delete(@RequestParam("imgno")int imgno, HttpServletRequest request) {
			
			log.info("진입 딜리트");
			String reno =request.getParameter("reno");
			int re = Integer.parseInt(reno);
			System.out.println(re);
			service.deleteReply(re);
			return "redirect:/trip/travel-p?imgno=" +imgno;
		}	
		
		
		//댓글 업데이트
		@PostMapping("/update")
		public String update(TripReplyDTO dto, @RequestParam("imgno")int imgno,@RequestParam("content")String content) {
			
			
			service.updateReply(dto);	
			
			return"redirect:/trip/travel-p?imgno=" +imgno;
		}
		
		
		
		
}




