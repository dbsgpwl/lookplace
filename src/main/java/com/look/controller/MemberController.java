package com.look.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		@GetMapping("/findid")
		public void findIDGET(Model model) {		
			
			log.info("아이디찾기 페이지 진입");		
		}
	    @GetMapping("/info")
	    public void getPrevModify(Authentication auth) {

	    }
	
		/* 로그인 */
		@RequestMapping(value="login", method=RequestMethod.POST)
		public String loginPOST(HttpServletRequest request, MemberDTO dto, RedirectAttributes rttr) throws Exception {
			 
			
		     HttpSession session = request.getSession();
			 MemberDTO mdto = memberservice.memberLogin(dto);
			
			
			 if(mdto == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
		            
		            int result = 0;
		            rttr.addFlashAttribute("result", result);
		            return "redirect:/member/login";
		            
		        }
		        
		        session.setAttribute("member", mdto);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		        
		        return "redirect:/";
		}
		
		/* 메인 페이지(header) 로그아웃*/
		@RequestMapping(value="logout", method=RequestMethod.GET)
		public String logoutMainGET(HttpServletRequest request) throws Exception{
			
			System.out.println("logout");
			HttpSession session = request.getSession(); // session 변수 초기화
			
			session.invalidate();
			
			return "redirect:/";
			
		}
		
		@GetMapping("/signup")
		public void signupGET(Model model) {
			
			log.info("회원가입 페이지 진입");					
		}
		
		/* 회원가입 */
		@RequestMapping(value="/signup", method=RequestMethod.POST)
		public String signupPOST(MemberDTO dto) throws Exception{
			// 회원가입 서비스
			
			memberservice.memberJoin(dto);			
			
			return "redirect:/";
		}
		
		/* 회원가입 이메일 인증 */
		@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
		@ResponseBody
		public String mailCheckGET(String email) throws Exception{
			/* 인증번호 난수 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			
			/* 이메일 보내기*/
			String setForm = "min11600@naver.com";
			String toMail = email;
			String title = "LookPlace 회원가입 인증 메일입니다.";
			String content = 
					"LookPlace를 방문해주셔서 감사합니다." +
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
		
		/* 아이디 찾기 이메일*/
		@RequestMapping(value="/mailCheckfind", method=RequestMethod.GET)
		@ResponseBody
		public String mailfindCheckGET(String email) throws Exception{
			/* 인증번호 난수 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			
			/* 이메일 보내기*/
			String setForm = "min11600@naver.com";
			String toMail = email;
			String title = "LookPlace 아이디 찾기 인증 메일입니다.";
			String content = 
					"LookPlace를 방문해주셔서 감사합니다." +
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
		
		/* 비밀번호 찾기 */
		
		/* 아이디 중복 체크 */
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
	
