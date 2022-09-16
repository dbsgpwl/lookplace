package com.look.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.look.model.MemberDTO;
import com.look.service.MemberService;


@Controller					
@RequestMapping("/member/*") 
public class MemberController {
	 
		@Autowired
		private MemberService memberservice;
		
		@Autowired
		private JavaMailSender mailSender;
		
		
		private static final Logger log = LoggerFactory.getLogger(MemberController.class);
		
		
		@GetMapping("/login")
		public void loginGET(Model model) {		
			
			log.info("로그인 페이지 진입");		
		}
		
		@GetMapping("/signup")
		public void signupGET(Model model) {
			
			log.info("회원가입 페이지 진입");					
		}
		
		
		@RequestMapping(value="/signup", method=RequestMethod.POST)
		public String signupPOST(MemberDTO dto) throws Exception{
			log.info("signup 진입");
			
			// 회원가입 서비스
			memberservice.memberJoin(dto);
			log.info("join service 성공");
			
			return "redirect:/";
		}
		
		@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
		@ResponseBody
		public String mailCheckGET(String email) throws Exception{
			/* view로부터 넘어온 데이터 확인 */
			log.info("이메일 데이터 전송 확인");
			log.info("인증번호 : " + email);
			System.out.println(email);
			
			/* 인증번호 난수 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			
			/* 이메일 보내기*/
			String setForm = "min11600@naver.com";
			String toMail = email;
			String title = "회원가입 인증 메일입니다.";
			String content = 
					"홈페이지를 방문해주셔서 감사합니다." +
					"<br><br>" + 
					"인증번호는 " + checkNum + "입니다." + 
					"<br>" + 
					"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setForm);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			String num = Integer.toString(checkNum);
			
			return num;
		}		
		
		
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String email) throws Exception{
			// 	System.out.println("memberIdChk 진입");
			
			int result = memberservice.idCheck(email);
			
			System.out.println("결과값 = " + result);
			
			if(result != 0 ) {
				return "fail";			 // 중복 아이디 존재	
			} else {
				return "success";        // 중복 아이디 x
			}
		}
}		
	
