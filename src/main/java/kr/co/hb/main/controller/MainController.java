package kr.co.hb.main.controller;

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

import kr.co.hb.main.dto.MainDTO;
import kr.co.hb.main.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainService service;
	
	@RequestMapping(value="/")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping(value="/gnb.go")
	public String gnb(Model model) {
		return "gnb";
	}
	@RequestMapping(value = "/logout.go", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("adminChk");
		return "main";
	}	
	
	@RequestMapping(value = "/admin.go", method = RequestMethod.GET)
	public String admin(HttpSession session) {
		return "admin";
	}
	@RequestMapping(value = "/RandomList.go", method = RequestMethod.GET)
	public String random(HttpSession session) {
		return "randomList";
	}
	@RequestMapping(value = "/noNameList.go", method = RequestMethod.GET)
	public String noNameRandom(HttpSession session) {
		return "noNameList";
	}
	@RequestMapping(value = "/idFind.go", method = RequestMethod.GET)
	public String idFind(HttpSession session) {
		return "idFind";
	}
	@RequestMapping(value = "pwFind.go", method = RequestMethod.GET)
	public String pwFind(HttpSession session) {
		return "pwFind";
	}

	@RequestMapping(value = "pwFind2.go", method = RequestMethod.GET)
	public String pwFind2(Model model, HttpSession session, @RequestParam String id, @RequestParam String phone) {
		String page = "pwFind2";
		logger.info(id,phone);
		
		MainDTO dto = service.pwFind2(id,phone);
		
		if(dto != null) {
			model.addAttribute("chkreq",dto.getChkreq());
			model.addAttribute("id",id);
			session.setAttribute("chkreq",dto.getChkreq());
			session.setAttribute("id",id);
		}		
		if(dto == null) {
			String result = "해당 아이디와 번호에 맞는 회원정보가 없습니다.";
			model.addAttribute("result",result);
			page = "pwFind";
		}		
		return page;
	}
	
	@RequestMapping(value = "pwFind3.go", method = RequestMethod.GET)
	public String pwFind3(Model model, HttpSession session, @RequestParam String id, @RequestParam String chkreq, @RequestParam String chkresp) {
		logger.info(id,chkresp);
		String page = "pwFind2";
		
		MainDTO dto = service.pwFind3(id,chkresp);
		
		if(dto != null) {
			model.addAttribute("msg","비밀번호가 1111로 변경되었습니다.");
			service.pwFind4(id);
			page = "main";
		}		
		if(dto == null) {
			model.addAttribute("msg","해당 아이디에 대한 답변이 틀렸습니다.");
			
		}		
		return page;
	}
	
	
	@RequestMapping(value="/idFind.do", method = RequestMethod.GET)
	public String idFind2(@RequestParam HashMap<String, String> params, Model model){
		logger.info("idFind2 : "+ params);
		String findId = (String) service.idFind2(params);
		
		if(findId == null) {
			findId = "해당 전화번호와 이메일에 맞는 아이디가 없습니다.";
		}
		logger.info("findId : "+ findId);
		model.addAttribute("findId",findId);
		return "idFind";
	}
}
	

