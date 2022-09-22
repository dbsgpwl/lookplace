package com.look.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.look.model.MemberDTO;
import com.look.model.CommunityReplyDTO;
import com.look.service.CommunityReplyService;


@Controller
@RequestMapping("/reply/*")
public class BoardReplyCommunityController {

	@Autowired
	private CommunityReplyService rservice;

	// 댓글 작성
	  @ResponseBody
	  @RequestMapping(value = "/write", method = RequestMethod.POST)
	  public void registReply(CommunityReplyDTO reply,  HttpSession session) throws Exception {

	     MemberDTO member = (MemberDTO)session.getAttribute("member");
	     reply.setNickname(member.getNickname());

	     rservice.replyWrite(reply);
	  }   

	// 댓글 목록
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<CommunityReplyDTO> getReplyList(@RequestParam("n") int bno) throws Exception {

	 List<CommunityReplyDTO> reply = rservice.replyList(bno);

	 return reply;
	} 

	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int getReplyList(CommunityReplyDTO reply,  HttpSession session) throws Exception {

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
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public int modifyReply(CommunityReplyDTO reply, HttpSession session) throws Exception {
	 
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
