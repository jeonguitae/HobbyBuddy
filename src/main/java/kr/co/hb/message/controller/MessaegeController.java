package kr.co.hb.message.controller;

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

import kr.co.hb.message.dto.MessageDTO;
import kr.co.hb.message.service.MessageService;

@Controller
public class MessaegeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MessageService service;
	

	@RequestMapping(value = "/msgList.go", method = RequestMethod.GET)
	public String msgList(HttpSession session, Model model) {
		logger.info("msgList call");
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList = service.msgList(id);
		model.addAttribute("msgList", msgList);	
		return "msgList";
	}
	
	
	@RequestMapping(value = "/msgReply.go", method = RequestMethod.GET)
	public String msgReply(HttpSession session, Model model, @RequestParam String id_send) {
		logger.info("msgReply call");
		String id = (String) session.getAttribute("loginId");
		logger.info("msgReply call id_send : " + id_send);		
		model.addAttribute("id_send", id_send);	
		return "msgReply";
	}
	
	@RequestMapping(value="/msgReply.do", method=RequestMethod.GET)
	public String msgReplyDo(@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
		service.msgReplyDo(params);
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList = service.msgList(id);
		model.addAttribute("msgList", msgList);
		return "msgList";
	}
	
	
}
