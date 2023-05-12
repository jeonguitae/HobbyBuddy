package kr.co.hb.group.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
import kr.co.hb.group.service.OpenChatService;
import kr.co.hb.member.dto.MemberDTO;

@Controller
public class OpenChatController {
	
	@Autowired OpenChatService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping (value={"/openchat.go", "/listmsg.go"})
	public String openchatForm(Model model, HttpSession session, HttpServletRequest req) {		
		
		String loginId = (String)session.getAttribute("loginId");
		int gidx = (int) session.getAttribute("gidx");
		String page = "openChat";
		
		String uri = req.getRequestURI();
		String ctx = req.getContextPath(); 
		String addr = uri.substring(ctx.length());
		String msg2 = "";
		
		if(addr.equals("/openchat.go")) {
		
		HashMap<String, Integer> conmap = service.memconchk(loginId);
		Set<String> mkeys = conmap.keySet();
		Iterator<String> memiterator = mkeys.iterator();
		Integer memage = 0;
		
		Integer memmannertp = conmap.get(memiterator.next());
		logger.info("memmannertp : " + memiterator);
		
		if (memiterator.hasNext()) {
		    memage = conmap.get(memiterator.next());
		}
		
		logger.info("memage : " + memage);
		
		HashMap<String, Integer> conopen = service.openconchk(gidx);
		Set<String> okeys = conopen.keySet();
		Iterator<String> oiterator = okeys.iterator();
		Integer openminage = 0;
		Integer openmaxage = 0;
		
		Integer openmannertp = conopen.get(oiterator.next());
		logger.info("openmannertp : " + openmannertp);
		
		if (oiterator.hasNext()) {
			openmaxage = conopen.get(oiterator.next());
		}
		
		if (oiterator.hasNext()) {
			openminage = conopen.get(oiterator.next());
		}
		
		logger.info("openminage : " + openminage);
		logger.info("openmaxage : " + openmaxage);
		
		boolean agechkin = memage > openminage && memage < openmaxage;
		boolean mannerchkin = memmannertp >= openmannertp;
		logger.info("agechkin : " + agechkin);
		logger.info("mannerchkin : " + mannerchkin);
		
		if((agechkin && mannerchkin) == false) {
			
			msg2 = "해당 방에 조건에 맞지 않습니다";
			session.setAttribute("msg2", msg2);;
			page = "redirect:/glist.go";
		}
		
		int chk = service.memchk(loginId, gidx);
		logger.info("chk : " + chk);
		
		
		if(chk == 0) {
			
			int row = service.openlist(loginId, gidx);
		}
		
		
		 ArrayList<OpenChatDTO> list = service.openchatlist(gidx);
		  
		 model.addAttribute("list", list);
		 
		
		/*
		 * ArrayList<OpenChatDTO> listmsg = service.clist(gidx);
		 * 
		 * model.addAttribute("listmsg", listmsg);
		 */
		
		}
		
		else {
			
			
			 logger.info("addr : " + addr);
			 
			 ArrayList<OpenChatDTO> list = service.openchatlist(gidx);
			  
			 model.addAttribute("list", list);
			 
		
		/*
		 * ArrayList<OpenChatDTO> listmsg = service.clist(gidx);
		 * 
		 * model.addAttribute("listmsg", listmsg);
		 */
		
		}
		
		String msg = (String) session.getAttribute("msg");
		
		model.addAttribute("msg", msg);
		
		session.removeAttribute("msg");
		
		return page;
	}
	
	@RequestMapping(value="/sendmsg.do")
	public String sendmsg(@RequestParam HashMap<String, String> params, HttpSession session, HttpServletRequest req) {		
		
		logger.info("params : " + params);
		int gidx = (int) session.getAttribute("gidx");
		String id = params.get("id");
		String msg = params.get("msg");
		int row = service.sendmsg(gidx, id, msg);
		
		
		return "redirect:/listmsg.go";
	}
	
	@RequestMapping(value = "/clist.ajax")
	@ResponseBody
	public HashMap<String, Object> clistCall(HttpSession session){

		HashMap<String, Object> map = new HashMap<String, Object>();
			
			int gidx = (int) session.getAttribute("gidx");
			
			ArrayList<OpenChatDTO> clist = service.clist(gidx);
			map.put("clist", clist);
		
		return map;
	}
	
	 
}
