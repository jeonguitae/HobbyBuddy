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
import kr.co.hb.group.service.GroupBoardService;

@Controller
public class GroupBoardController {
	
	@Autowired GroupBoardService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/sorting.do")
	public String sorting(Model model, @RequestParam HashMap<String, String> params) {		
				
		logger.info("검색 조건 : " + params);
		
		return service.sorting(params);
	}
	
	@RequestMapping(value="/gwrite.go")
	public String gwriteform(Model model, @RequestParam HashMap<String, String> params) {		
		
		return "gBoardCreate";
	}
	
	@RequestMapping(value="/gwrite.do")
	public String gwrite(Model model, @RequestParam HashMap<String, String> params) {		
				
		logger.info("생성 데이터 : " + params);
	}

}
