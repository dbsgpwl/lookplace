package com.look.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.mapper.MemberMapper;
import com.look.model.MemberDTO;
import com.look.service.MemberService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MemberService memberservice;

	@Autowired
	private MemberMapper membermapper;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Autowired
	private HttpSession session;

	private static final Logger log = LoggerFactory.getLogger(MypageController.class);

	@GetMapping("/info")
	public void infoGET(Model model) {
		log.info("마이 페이지 진입");
	}

	@GetMapping("/update")
	public void updateGET(Model model) {
		log.info("회원수정 페이지 진입");
	}

	@GetMapping("/wishlist")
	public void wishlistGET(Model model) {

		log.info("위시리스트 페이지 진입");
	}

	@GetMapping("/leavemember")
	public void leavememberGET(Model model) {

		log.info("회원탈퇴 페이지 진입");
	}

	/* 회원 수정 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(MemberDTO dto, HttpSession session) throws Exception {

		memberservice.memberUpdate(dto);

		session.invalidate();

		return "redirect:/";
	}
	
	/* 회원 탈퇴 */
	@RequestMapping(value="/leavemember", method = RequestMethod.POST)
	public String deletePOST(MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		
		
		// 세션에 있는 member를 가져와 member 변수에 넣어준다.
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		/*  세션에 값이 들어가는지 확인
		String aa = member.getEmail();
		String bb = member.getPassword();
		
		System.out.println("aa : " + aa);
		System.out.println("bb : " + bb);
		*/
		
		// 세션에 있는 비밀번호
		String sessionPW = member.getPassword();
		
		// dto로 들어오는 비밀번호
		String dtoPW = dto.getPassword();
		
		if(!(sessionPW.equals(dtoPW))) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/mypage/leavemember";
		}
		memberservice.memberDelete(dto);
		session.invalidate();
		return "redirect:/";
		
		
		
	}	 
}
