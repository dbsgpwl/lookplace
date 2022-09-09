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
@RequestMapping("/member/*") 
public class MemberController {
	 
		private static final Logger log = LoggerFactory.getLogger(MemberController.class);
		
		
		
		@GetMapping("/login")
		public void loginGET(Model model) {
			
			log.info("로그인 페이지 진입");
			
		}
		
		@GetMapping("/signup")
		public void signupGET(Model model) {
			
			log.info("회원가입 페이지 진입");
			
		}
		
		
		
		
	
	 
}
