package com.yun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yun.service.BoardService;
@Controller
public class mainController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="test")
	public String test(Model model) {
	  model.addAttribute("viewAll", boardService.viewAll());
	  return "board/test";
	}
}
