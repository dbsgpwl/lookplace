package com.look.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.look.model.ReplyDTO;
import com.look.service.ReplyReviewService;

@Controller
@RequestMapping("/reply/*")
public class BoardReplyReviewController {

		@Autowired
		private ReplyReviewService rservice;
		
		// 댓글 작성
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String replyWrite(ReplyDTO vo) throws Exception {
			
			rservice.replyWrite(vo);
			
			return "redirect:/get-r?bno=" + vo.getBno();
		}
		
		/*
		 * // 댓글 수정 POST
		 * 
		 * @RequestMapping(value = "/Update", method = RequestMethod.POST) public String
		 * replyUpdate(ReplyDTO vo, Criteria cri, RedirectAttributes rttr) throws
		 * Exception {
		 * 
		 * rservice.replyModify(vo);
		 * 
		 * rttr.addAttribute("bno", vo.getBno()); rttr.addAttribute("keyword",
		 * cri.getKeyword());
		 * 
		 * return "redirect:/get-r?bno=" + vo.getBno(); }
		 */

}
