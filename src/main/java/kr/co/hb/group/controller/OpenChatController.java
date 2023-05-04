package kr.co.hb.group.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.group.dto.OpenChatDTO;
import kr.co.hb.group.service.OpenChatService;

@Controller
public class OpenChatController {
	
	@Autowired OpenChatService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/openchat.go")
	public String openchatForm(Model model, @RequestParam HashMap<String, String> params) {		
		
		logger.info("params : " + params);
		
		int row = service.openlist(params);
		return "openChat";
	}
	
	@RequestMapping(value="/openlist.do")
	public String openchatlist(Model model) {		
		
		ArrayList<OpenChatDTO> list = service.openchatlist();
		
		model.addAttribute("list", list);
		return "openChat";
	}
}
