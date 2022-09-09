package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.look.service.BoardService;
import com.look.service.MemberService;

@Controller					
@RequestMapping("/trip/*") 
public class TripController {
	 
		private static final Logger log = LoggerFactory.getLogger(TripController.class);
		
		
		
		@GetMapping("/area")
		public void areaGET(Model model) {
			
			log.info("지역 페이지 진입");
			
		}
		
		@GetMapping("/best")
		public void wishlistGET(Model model) {
			
			log.info("인기 페이지 진입");
			
		}
		
		
		@GetMapping("/course")
		public void leavememberGET(Model model) {
			
			log.info("코스 페이지 진입");
			
		}
		
		@GetMapping("/entire")
		public void entireGET(Model model) {
			
			log.info("전체 페이지 진입");
			
		}
		
		@GetMapping("/travel-p")
		public void travelpGET(Model model) {
			
			log.info("여행지 상세 페이지 진입");
			
		}
		
		@GetMapping("/travel-c")
		public void travelcGET(Model model) {
			
			log.info("코스 상세 페이지 진입");
			
		}
		
		
		
		
	
	 
}
