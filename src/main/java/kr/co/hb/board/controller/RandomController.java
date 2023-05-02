package kr.co.hb.board.controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.board.service.RandomService;


@Controller
public class RandomController {
		
	@Autowired RandomService Service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/profile.go")
	public String list(Model model) {		
		logger.info("start");
		return "proList";
	}
	
	@RequestMapping(value="/profile.do")
	public String profileList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.profileList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "proList";
	}
	
}
