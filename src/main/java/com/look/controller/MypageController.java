package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.look.service.BoardService;

@Controller					
@RequestMapping("/mypage/*") 
public class MypageController {
	 
		private static final Logger log = LoggerFactory.getLogger(MypageController.class);
		
		
		
		@GetMapping("/info")
		public void infoGET(Model model) {
			
			log.info("마이 페이지 진입");
			
		}
		
		@GetMapping("/wishlist")
		public void wishlistGET(Model model) {
			
			log.info("위시리스트 페이지 진입");
			
		}
		
		
		@GetMapping("/leavemember")
		public void leavememberGET(Model model) {
			
			log.info("회원탈퇴 페이지 진입");
			
		}
		
		
		
		
	
	 
}
