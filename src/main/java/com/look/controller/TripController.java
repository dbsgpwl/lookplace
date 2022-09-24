package com.look.controller;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			model.addAttribute("autumn",service.autumnList());
		
			log.info("인기 페이지 진입");		
		}		
		
		/* 전체/지역 목록 페이지 접속  */
		@GetMapping("/entire")
		public void entireGET(Criteria cri, Model model, @RequestParam(defaultValue = "")String nickname,HttpServletRequest request) {
			
			
			String type = request.getParameter("type");
			if(type==null) {
				type = "최신순";
			}	
			if(type.equals("인기순")) {
				model.addAttribute("trip", service.HitGetList(cri));
			}else {
				model.addAttribute("trip", service.localListPaging(cri));
			}
			
			model.addAttribute("key", cri.getKeyword());
			model.addAttribute("nick", service.nickCheck(nickname));
			
			
			/*페이징 처리*/
			int total = service.localTotal(cri);
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
			log.info("전체 페이지 진입");			
		}
		
		
		//전체 지역 최신순 인기순 
		@PostMapping("/type")
		public String popPOST(@RequestParam("keyword")String keyword,Criteria cri,TripHeartDTO dto, HttpServletRequest request, Model model) throws UnsupportedEncodingException{
			String encodedParam = URLEncoder.encode(keyword, "UTF-8");
			String encodedParam1 = URLEncoder.encode(dto.getNickname(), "UTF-8");
			
			
			/*페이징 처리*/
			int total = service.localTotal(cri);
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			if(dto.getNickname().equals("")) {
				return "redirect:/trip/entire?keyword=" +encodedParam;
			}else {
				return "redirect:/trip/entire?"+"nickname="+encodedParam1+"&keyword=" +encodedParam;
			}
		}
		
		
		//게시물 좋아요 기능
		@PostMapping("/heart")
		public String heart(@RequestParam("keyword")String keyword, TripHeartDTO dto, HttpServletResponse response) throws Exception{
			
			String encodedParam = URLEncoder.encode(keyword, "UTF-8");
			String encodedParam1 = URLEncoder.encode(dto.getNickname(), "UTF-8");
			
			response.setContentType("text/html; charset=euc-kr");
			
			if(dto.getNickname().equals("")) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 후 이용하세요'); </script>");
				out.println("<script>var link = '/'; location.href=link;location.replace(link);</script>");
				out.flush();
			}
			
			service.insertHeart(dto);
			service.PlusHeart(dto);	
			
			
			return "redirect:/trip/entire?"+"nickname="+encodedParam1+"&keyword=" +encodedParam;
		}
		
		//게시물 좋아요 취소
		@PostMapping("/unheart")
		public String unheart(TripHeartDTO dto,@RequestParam("keyword")String keyword, HttpServletRequest request,  @RequestParam(defaultValue = "")String nickname) throws UnsupportedEncodingException{
			String encodedParam = URLEncoder.encode(keyword, "UTF-8");
			String encodedParam1 = URLEncoder.encode(dto.getNickname(), "UTF-8");
			
			service.unheart(dto);
			service.minusHeart(dto);
			
			return "redirect:/trip/entire?"+"nickname="+encodedParam1+"&keyword=" +encodedParam;
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




