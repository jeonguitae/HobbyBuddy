package kr.co.hb.group.controller;

import java.sql.Date;
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

import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.group.service.GroupBoardService;
import kr.co.hb.group.service.OpenChatService;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;

@Controller
public class GroupBoardController {
	
	@Autowired GroupBoardService service;
	@Autowired OpenChatService oservice;
	@Autowired MemberService mservice;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value="/glist.go")
	public String list(Model model) {
		
		logger.info("Gboard 이동");
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		
		logger.info("listcall");
		ArrayList<GroupBoardDTO> list = service.glist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/gsorting.do")
	public String sorting(Model model, @RequestParam HashMap<String, String> params) {		
				
		logger.info("검색 조건 : " + params);
		
		ArrayList<GroupBoardDTO> list = service.gsorting(params);
		
		model.addAttribute("list", list);
		
		return "gBoardList";
	}
	
	@RequestMapping(value="/gwrite.go")
	public String gwriteform(Model model, @RequestParam HashMap<String, String> params) {		
		
		return "gBoardCreate";
	}
	
	@RequestMapping(value="/gwrite.do")
	public String gwrite(Model model, @RequestParam HashMap<String, String> params) {		
		
		logger.info("생성 데이터 : " + params);
		
		int row = service.gwrite(params);
		
		return "redirect:/glist.go";
	}
	
	@RequestMapping(value="/gdetail.do")
	public String gdetail(Model model, @RequestParam int id, HttpSession session) {
		
		logger.info("idx : " + id);
		GroupBoardDTO dto = service.gdetail(id);
		
		session.setAttribute("gidx", id);
		
		model.addAttribute("board", dto);
		
		return "gBoardDetail";
	}

	@RequestMapping(value="/gserch.do")
	public String gserch(Model model, @RequestParam HashMap<String, String> params) {
		
		ArrayList<GroupBoardDTO> list = service.gserch(params);
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/greport.go")
	public String greList(Model model) {
		
		logger.info("start");
		return "reportCreate";
	}
	

}