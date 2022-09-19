package com.look.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.look.model.ReplyDTO;
import com.look.model.ReviewDTO;
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
		
		// 댓글 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String replyWDelete(ReplyDTO dto, @RequestParam("rno")int rno) throws Exception {
					
			rservice.replyDelete(rno);
					
			/*
			 * rttr.addAttribute("bno",vo.getBno()); rttr.addAttribute("rno",vo.getRno());
			 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
			 * cri.getAmount()); rttr.addAttribute("keyword", cri.getKeyword());
			 * rttr.addAttribute("type", cri.getType());
			 */
			return "redirect:/get-r?bno=" +dto.getBno();
		}
		
}
