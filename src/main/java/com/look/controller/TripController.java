package com.look.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.look.model.Criteria;
import com.look.model.TripDTO;
import com.look.service.TripService;

import lombok.AllArgsConstructor;

@Controller					
@RequestMapping("/trip/*") 
@AllArgsConstructor

import com.look.service.BoardService;

@Controller					
@RequestMapping("/map/*") 

public class TripController {
	 
		private static final Logger log = LoggerFactory.getLogger(TripController.class);
		
		private TripService service;
		

		@GetMapping("/area")
		public void areaGET(Criteria cri, Model model) {
			model.addAttribute("trip", service.locationList(cri));

		@GetMapping("/mapapi")
		public void mapGET(Model model) {

			
			log.info("지도 페이지 진입");			
		}
		

		@GetMapping("/best")
		public void bestGET(Model model) {
			model.addAttribute("list", service.getList());
			log.info("인기 페이지 진입");		
		}		
		
		@GetMapping("/course")
		public void leavememberGET(Model model) {
			
			log.info("코스 페이지 진입");			
		}
		
		@GetMapping("/entire")
		public void entireGET(Model model) {
			model.addAttribute("list", service.getList());
			log.info("전체 페이지 진입");			
		}

		
}
