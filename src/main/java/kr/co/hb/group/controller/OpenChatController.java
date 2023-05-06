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

import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.group.dto.OpenChatDTO;
import kr.co.hb.group.service.OpenChatService;

@Controller
public class OpenChatController {
	
	@Autowired OpenChatService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/openchat.go")
	public String openchatForm(Model model, @RequestParam String loginId, @RequestParam int gidx) {		
			
		int chk = service.memchk(loginId, gidx);
		logger.info("chk : " + chk);
		
		if(chk == 0) {
			
			int row = service.openlist(loginId, gidx);
		}
		
		ArrayList<OpenChatDTO> list = service.openchatlist(gidx);
		
		model.addAttribute("list", list);
		
		return "openChat";
	}
	
	@RequestMapping(value="/sendmsg.ajax")
	public HashMap<String, Object> sendmsg(HashMap<String, Object> params) {		
				
		int row = service.sendmsg(params);
		logger.info("params : " + params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
	
	/*
	 * @RequestMapping(value="/opclist.ajax") public HashMap<String, Object>
	 * opclist(){
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * return map; }
	 */
}
