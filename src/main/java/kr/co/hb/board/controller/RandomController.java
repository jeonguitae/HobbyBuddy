package kr.co.hb.board.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.board.service.RandomService;
import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;



@Controller
public class RandomController {
		
	@Autowired RandomService Service;
	@Autowired MemberService service2;
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/profile.go")
	public String plist(Model model) {		
		logger.info("start");

		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<RandomDTO> list = Service.plist();
	    model.addAttribute("list", list);
//	    RandomDTO dto = new RandomDTO();
//	    String qq = dto.getSmall_hb();
//	    logger.info("list"+qq);
//	    logger.info("list",qq);
		
		return "proList";
	}
	
	@RequestMapping(value="/profile.do")
	public String profileList(Model model, @RequestParam HashMap<String, String> params) {
		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<RandomDTO> list = Service.profileList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "proList";
	}
	
	@RequestMapping(value="/psearch.do")
	public String psearch(Model model, @RequestParam HashMap<String, String> params) {
		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<RandomDTO> list = Service.psearch(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list", list);
		return "proList";
	}
	
	@RequestMapping(value="/randomList.go")
	public String rlist(Model model) {		
		logger.info("start");
		
		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
//		ArrayList<RandomDTO> list = Service.plist();
//	    model.addAttribute("list", list);
		
		
		return "randomList";
	}
	
	@RequestMapping(value="/randomList.do")
	public String randomList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.randomList(params);
		logger.info("검색 조건 : " + params);
		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		model.addAttribute("list",list);
		return "randomList";
	}

	@RequestMapping(value="/noNameList.do")
	public String nonameList(Model model, @RequestParam HashMap<String, String> params) {	
		
		ArrayList<RandomDTO> list = Service.noNameList(params);
		logger.info("검색 조건 : " + params);
		
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		model.addAttribute("list",list);
		return "noNameList";
	}
	
	@RequestMapping(value="/report.go")
	public String reList(Model model, @RequestParam String id) {		
		logger.info("start");
		
		model.addAttribute("id",id);
		return "reportCreate";
	}
	
	@RequestMapping(value="/report.do")
	public String reportList(Model model, @RequestParam HashMap<String, String> params) {	
		
		int row = Service.reList(params);
		
		String msg = "";
	      if(row == 1) {
	         msg = "신고가 완료되었습니다.";
	      }
	      model.addAttribute("msg",msg);
		
		
		ArrayList<RandomDTO> list = Service.profileList(params);
		logger.info("검색 조건 : " + params);
		model.addAttribute("list",list);
		return "proList";
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String detail(@RequestParam String id,Model model ) {
			
		String page = "redirect:/list.do";
		
		logger.info("취미 등록 페이지 이동");
		ArrayList<MemberDTO> big_hb = service2.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		RandomDTO dto= Service.detail(id);
		RandomDTO photo = Service.proPhotoList(id);
		logger.info("dto"+dto);
		logger.info("photo"+photo);
		if(dto != null) {
			page = "proDetail";
			model.addAttribute("member",dto);
			model.addAttribute("photo",photo);
		}
		
		return "proDetail";
	}
	
	@RequestMapping(value = "/nodetail.do", method = RequestMethod.GET)
	public String nodetail(@RequestParam String id,Model model) {
			
		String page = "redirect:/list.do";
		
		RandomDTO dto= Service.detail(id);
		logger.info("dto"+dto);
		if(dto != null) {
			page = "noNameDetail";
			model.addAttribute("member",dto);
		}
		return "noNameDetail";
	}
		
		@RequestMapping(value="/banupdate.do", method = RequestMethod.GET)
			public String banupdate(@RequestParam String id, Model model) {
			int row = Service.banupdate(id);
			return "redirect:/detail.do?id=" + id;
		}

		@RequestMapping(value="/bupdate.do", method = RequestMethod.GET)
		public String bupdate(@RequestParam String id, Model model) {
		int row = Service.bupdate(id);
		return "redirect:/detail.do?id=" + id;
	}
		
		@RequestMapping(value="/adminupdate.do", method = RequestMethod.GET)
		public String adminupdate(@RequestParam String id, Model model) {
		int row = Service.adminupdate(id);
		return "redirect:/detail.do?id=" + id;
	}
		
		@RequestMapping(value="/aupdate.do", method = RequestMethod.GET)
		public String aupdate(@RequestParam String id, Model model) {
		int row = Service.aupdate(id);
		return "redirect:/detail.do?id=" + id;
	}
}
