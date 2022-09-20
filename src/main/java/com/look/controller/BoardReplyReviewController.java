package com.look.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.look.model.MemberDTO;
import com.look.model.ReplyDTO;
import com.look.service.ReplyReviewService;


@Controller
@RequestMapping("/reply/*")
public class BoardReplyReviewController {

	@Autowired
	private ReplyReviewService rservice;
	
	// 댓글 작성
	  @ResponseBody
	  @RequestMapping(value = "/write", method = RequestMethod.POST)
	  public void registReply(ReplyDTO reply,  HttpSession session) throws Exception {
	     
	     MemberDTO member = (MemberDTO)session.getAttribute("member");
	     reply.setNickname(member.getNickname());
	     
	     rservice.replyWrite(reply);
	  }   
	
	// 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<ReplyDTO> getReplyList(@RequestParam("n") int bno) throws Exception {
	   
	 List<ReplyDTO> reply = rservice.replyList(bno);
	 
	 return reply;
	} 
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int getReplyList(ReplyDTO reply,  HttpSession session) throws Exception {

	   int result = 0;
	   
	   MemberDTO member = (MemberDTO)session.getAttribute("member");
	   String nickname = rservice.idCheck(reply.getRno());
	     
	   if(member.getNickname().equals(nickname)) {
	    
	    reply.setNickname(member.getNickname());
	    rservice.replyDelete(reply);
	    
	    result = 1;
	   }
	   
	   return result;   
	}
	
	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public int modifyReply(ReplyDTO reply, HttpSession session) throws Exception {
	   
	   int result = 0;
	   
	   MemberDTO member = (MemberDTO)session.getAttribute("member");
	   String userId = rservice.idCheck(reply.getRno());
	   
	   if(member.getNickname().equals(userId)) {
	    
	    reply.setNickname(member.getNickname());
	    rservice.modifyReply(reply);
	    result = 1;
	   }
	   
	   return result;
	}   
}
