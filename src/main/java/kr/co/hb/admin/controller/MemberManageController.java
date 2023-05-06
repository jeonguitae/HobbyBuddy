package kr.co.hb.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.board.service.RandomService;

@Controller
public class MemberManageController {

	
	@Autowired RandomService Service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/memberlist.go")
	public String mlist(Model model) {		
		logger.info("start");
		return "memberList";
	}
	

}
