package kr.co.hb.board.controller;


import java.util.ArrayList;
import java.util.HashMap;

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

import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.board.service.RandomService;
import kr.co.hb.group.dto.GroupBoardDTO;


@Controller
public class RandomController {
		
	@Autowired RandomService Service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/profile.go")
	public String plist(Model model) {		
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
	
	@RequestMapping(value="/random.go")
	public String rlist(Model model) {		
		logger.info("start");
		return "randomList";
	}
	
	@RequestMapping(value="/random.do")
	public String randomList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.randomList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "randomList";
	}
	
	@RequestMapping(value="/noname.go")
	public String nlist(Model model) {		
		logger.info("start");
		return "noNameList";
	}
	
	@RequestMapping(value="/noname.do")
	public String nonameList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.nonameList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "noNameList";
	}
	
	@RequestMapping(value="/report.go")
	public String reList(Model model) {		
		logger.info("start");
		return "reportCreate";
	}
	
	@RequestMapping(value="/report.do")
	public String reportList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.profileList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "reportList";
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam String id,Model model) {
			
		String page = "redirect:/list.do";
			
		RandomDTO dto= Service.detail(id);
		if(dto != null) {
			page = "proDetail";
			model.addAttribute("member",dto);
		}
		return "proDetail";
	}
		


	
}
