package kr.co.hb.member.controller;

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
import org.springframework.web.multipart.MultipartFile;


import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;

	@RequestMapping(value="/login.go")
	public String login() {
		logger.info("로그인 페이지 이동");
		return "login";
	}
	@RequestMapping(value="/join.go")
	public String join(Model model) {
		logger.info("회원가입 페이지 이동");
		ArrayList<MemberDTO> city = service.city();
		logger.info("city : " + city);
		model.addAttribute("city",city);		
		return "join";
	}
	@RequestMapping(value="/city.ajax")
	@ResponseBody
	public HashMap<String, Object> city(Model model, @RequestParam String city) {
		logger.info("도시 변경 : "+city);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MemberDTO> area = service.area(city);
		map.put("area", area);
		return map;
	}
	
	@RequestMapping(value="/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String id){
		logger.info("overlay : "+id);
		return service.overlay(id);
	}
	
	@RequestMapping(value="/join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.join(params);
	}
	
	@RequestMapping(value="/login.ajax")
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam String id,@RequestParam String pw, HttpSession session){
		logger.info(id+"/"+pw);
		int success = service.login(id,pw,session);
		logger.info("login success : "+success);
		if(success == 1) {
			session.setAttribute("loginId", id);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);

		return map;		
	}
	@RequestMapping(value="/mypage.go")
	public String mypage(Model model, HttpSession session) {
		ArrayList<MemberDTO> city = service.city();
		logger.info("city : " + city);
		model.addAttribute("city",city);
		return "myProDetail";
	}	
	@RequestMapping(value="/myProDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> myProDetail(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("myProDetail : "+ loginId);			
		HashMap<String, Object> map = service.myProDetail(loginId);
		logger.info("result : "+ map);
		return map;
	}
	@RequestMapping(value="/memberUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> memberUpdate(@RequestParam HashMap<String, String> params){
		logger.info("memberUpdate params : {}",params);
		return service.memberUpdate(params);		
	}


}
