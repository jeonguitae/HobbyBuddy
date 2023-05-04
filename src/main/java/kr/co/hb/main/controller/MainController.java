package kr.co.hb.main.controller;

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

import kr.co.hb.main.dto.MainDTO;
import kr.co.hb.main.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
}
