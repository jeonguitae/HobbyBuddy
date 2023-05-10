package kr.co.hb.group.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hb.group.service.SmallGroupService;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;

@Controller
public class SmallGroupController {
	
	@Autowired SmallGroupService service;
	@Autowired MemberService mservice;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value="/sgwrite.go")
	public String sgwriteForm(Model model) {
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		return "sGroupCreate";
	}

	
}
