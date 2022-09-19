package com.look.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller					
@RequestMapping("/map/*") 
public class MapController {

		private static final Logger log = LoggerFactory.getLogger(TripController.class);


		@GetMapping("/mapapi")
		public void mapGET(Model model) {

			log.info("지도 페이지 진입");			
		}
}
