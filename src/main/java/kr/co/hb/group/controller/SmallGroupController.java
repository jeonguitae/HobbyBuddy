package kr.co.hb.group.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hb.group.dto.OpenChatDTO;
import kr.co.hb.group.dto.SmallGroupDTO;
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
	
	@RequestMapping(value="/sgwrite.do")
	public String sgwrite(Model model, HttpSession session, @RequestParam HashMap<String, String> params) {
		
		int gidx = Integer.parseInt(params.get("gidx"));
		logger.info("gidx : " + gidx);
		
		int row = service.sgwrite(params);
		
		return "redirect:/openchat.go";
	}
	
	@RequestMapping(value = "/sglist.ajax")
	@ResponseBody
	public HashMap<String, Object> sglistCall(HttpSession session){

		HashMap<String, Object> map = new HashMap<String, Object>();
			
			int gidx = (int) session.getAttribute("gidx");
			
			ArrayList<SmallGroupDTO> sglist = service.sglist(gidx);
			
			map.put("sglist", sglist);
		
		return map;
	}
	
	@RequestMapping(value="/sgjoin.do")
	public String sgjoin(Model model, HttpSession session, @RequestParam int sidx) {
		String msg = "참가 실패";
		
		String id = (String) session.getAttribute("loginId");
		int gidx = (int) session.getAttribute("gidx");
		
		int chk1 = service.memchk(id, sidx);
		int chk2 = service.maxmemchk(sidx);
		int maxmem = service.maxmem(sidx);

		if(chk1 == 0 && chk2 < maxmem) {
			
			int row = service.sgjoin(sidx, gidx, id);
			
			if(row == 1) {
				
				msg = "참가완료!";
			}
		}
		
		else if(chk2 == maxmem) {
			
				msg = "정원이 초과되었습니다!";
		}
		
		session.setAttribute("msg", msg);
		return "redirect:/openchat.go";
	}
	
	@RequestMapping(value="/sgjoinlist.go")
	public String sgjoinlist(Model model, @RequestParam int sidx) {
		
		ArrayList<SmallGroupDTO> sgjlist = service.sgjlist(sidx);
		
		model.addAttribute("sgjlist", sgjlist);
		
		return "sGroupList";
	}

	
}
