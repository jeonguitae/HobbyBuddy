package kr.co.hb.mannertp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.mannertp.service.MannerTpService;
import kr.co.hb.message.dto.MessageDTO;

@Controller
public class MannerTpController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MannerTpService service;
		
	@RequestMapping(value="/mannertp.do")
	public String mannertp(Model model, @RequestParam String id_receive, @RequestParam String mpm, HttpSession session) {
		logger.info("mannertp" + id_receive + " / " + mpm);
		
		String id_send = (String) session.getAttribute("loginId");
		
		if(mpm.equals("plus")) {
			service.mannertpUp(id_receive,id_send,"+");
			service.mannertpUp2(id_receive,id_send,"+");
		}
		
		if(mpm.equals("minus")) {
			
		}
		
		if(mpm.equals("del")) {
		}
		
		return "proDetail";
	}
}
