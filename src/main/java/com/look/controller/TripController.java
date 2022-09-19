package com.look.controller;


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
		public void entireGET(Criteria cri, Model model) {
			model.addAttribute("trip", service.localListPaging(cri));
			model.addAttribute("key", cri.getKeyword());
			
			/*페이징 처리*/
			int total = service.localTotal();
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
			log.info("전체 페이지 진입");			
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
		@PostMapping("/travel-p")
		public String replyPOST(TripReplyDTO dto, @RequestParam("imgno")int imgno) {
			service.insertList(dto);
			return "redirect:/trip/travel-p?imgno=" +imgno;
		}
		
		
		
}
