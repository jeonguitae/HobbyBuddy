package kr.co.hb.admin.controller;

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

import kr.co.hb.admin.dto.MemberManageDTO;
import kr.co.hb.admin.service.MemberManageService;

@Controller
public class MemberManageController {

	
	@Autowired MemberManageService service;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/memberList.go")
	public String mlist(Model model) {		
		logger.info("start");
		return "memberList";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<MemberManageDTO> list = service.memberList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "memberList";
	}
	
	

}
