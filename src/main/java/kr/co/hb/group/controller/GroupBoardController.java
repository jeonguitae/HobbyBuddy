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
		String msg = "모임등록 실패!";
		int row = service.gwrite(params);
		
		if(row == 1) {
			
			msg = "모임등록 성공!";
		}
		
		model.addAttribute("msg", msg);
		return "redirect:/glist.go";
	}
	
	@RequestMapping(value="/gdetail.do")
	public String gdetail(Model model, @RequestParam int id) {
		
		logger.info("idx : " + id);
		GroupBoardDTO dto = service.gdetail(id);
		
		model.addAttribute("board", dto);
		
		return "gBoardDetail";
	}
	
	@RequestMapping(value="/gupdate.go")
	public String gupdateForm(Model model, @RequestParam int id) {		
			GroupBoardDTO dto = service.gupdate(id);
			model.addAttribute("board", dto);
		return "gBoardUpdate";
	}
	
	@RequestMapping(value="/gupdate.do")
	public String gupdate(Model model, @RequestParam HashMap<String, String> params) {		
			String msg = "수정실패";
			int row = service.gupdate(params);
			
			if(row == 1) {
				msg = "수정완료";
			}
			
			model.addAttribute("msg", msg);
		return "gBoardDetail";
	}

}
