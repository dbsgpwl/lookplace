package com.look.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.look.model.MemberDTO;
import com.look.model.TripHeartDTO;
import com.look.service.MemberService;
import com.look.service.TripService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired
	private MemberService memberservice;


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
	public void wishlistGET(Model model,MemberDTO dto){
		model.addAttribute("wish", memberservice.wishList(dto.getNickname()));
		log.info("위시리스트 페이지 진입");
	}
	@PostMapping("/unheart1")
	
	public String unheart(TripHeartDTO dto, HttpServletRequest request, @RequestParam(defaultValue = "")String nickname) throws UnsupportedEncodingException{
		
		String encodedParam1 = URLEncoder.encode(dto.getNickname(), "UTF-8");
		
		System.out.println(dto);
		
		memberservice.unheart(dto);
		memberservice.minusHeart(dto);
		
		return "redirect:/mypage/wishlist?nickname="+encodedParam1;
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
