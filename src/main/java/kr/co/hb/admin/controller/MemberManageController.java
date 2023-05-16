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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.admin.dto.MemberManageDTO;
import kr.co.hb.admin.service.MemberManageService;
import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;
import sun.tools.serialver.resources.serialver;

@Controller
public class MemberManageController {

	
	@Autowired MemberManageService service;
	@Autowired MemberService service2;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/memberList.go")
	public String mlist(Model model) {		
		logger.info("start");
		
		ArrayList<RandomDTO> list = service.alist();
	    model.addAttribute("list", list);
	    
		return "memberList";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, @RequestParam HashMap<String, String> params) {	
		ArrayList<MemberManageDTO> list = null;
		if (params.size() == 2) {
		    list = service.memberList();
		    logger.info("파람: " + params);
		    logger.info("파람 사이즈: " + params.size());
		}
		else if (params.size() == 1) {
		    if (params.containsKey("admin")) {
		        list = service.adminList();
		        logger.info("파람 사이즈: " + params.size());
		    }
		    else{
		        list = service.mList();
		        logger.info("파람 사이즈: " + params.size());
		    }
		}
		
		model.addAttribute("list",list);
		return "memberList";
	}

	@RequestMapping(value="/msearch.do")
	public String msearch(Model model, @RequestParam HashMap<String, String> params) {
		
		ArrayList<RandomDTO> list = service.msearch(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list", list);
		return "memberList";
	}
	
	@RequestMapping(value = "/mdetail.do", method = RequestMethod.GET)
	public String mdetail(@RequestParam String id,Model model) {
			
		String page = "redirect:/list.do";
		
		logger.info("취미 등록 페이지 이동");
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		MemberManageDTO dto= service.mdetail(id);
		MemberManageDTO photo = service.proPhotoList(id);
		logger.info("dto"+dto);
		logger.info("photo"+photo);
		if(dto != null) {
			page = "proDetail";
			model.addAttribute("member",dto);
			model.addAttribute("photo",photo);
		}
		return "memberDetail";
	}
	
	@RequestMapping(value="/banupdate.do", method = RequestMethod.GET)
	public String banupdate(@RequestParam String id, Model model) {
	int row = service.banupdate(id);
	return "redirect:/detail.do?id=" + id;
	}
	
	@RequestMapping(value="/bupdate.do", method = RequestMethod.GET)
	public String bupdate(@RequestParam String id, Model model) {
	int row = service.bupdate(id);
	return "redirect:/detail.do?id=" + id;
	}
	
	@RequestMapping(value="/adminupdate.do", method = RequestMethod.GET)
	public String adminupdate(@RequestParam String id, Model model) {
	int row = service.adminupdate(id);
	return "redirect:/detail.do?id=" + id;
	}
	
	@RequestMapping(value="/aupdate.do", method = RequestMethod.GET)
	public String aupdate(@RequestParam String id, Model model) {
	int row = service.aupdate(id);
	return "redirect:/detail.do?id=" + id;
	}

}
