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
	
	@RequestMapping(value = "/msgList2.go", method = RequestMethod.GET)
	public String msgList2(HttpSession session, Model model) {
		logger.info("msgList call");
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList2 = service.msgList2(id);
		model.addAttribute("msgList2", msgList2);	
		return "msgList2";
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
	
	
	@RequestMapping(value = "/msgChat.go", method = RequestMethod.GET)
	public String msgChat(HttpSession session, Model model, @RequestParam String id_receive) {
		logger.info("msgChat call id_receive : " + id_receive);		
		model.addAttribute("id_receive", id_receive);	
		return "msgChat";
	}
	
	@RequestMapping(value="/msgChat.do", method=RequestMethod.GET)
	public String msgChatDo(@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
		service.msgChatDo(params);
		
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList = service.msgList(id);
		model.addAttribute("msgList", msgList);
		return "msgList";
	}
	
	@RequestMapping(value="/msgDel.do", method=RequestMethod.GET)
	public String msgDel(@RequestParam String msgNo, HttpSession session, Model model) {
		service.msgDel(msgNo);
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList = service.msgList(id);
		model.addAttribute("msgList", msgList);
		return "msgList";
	}

	@RequestMapping(value = "/reportMsg.go", method = RequestMethod.GET)
	public String msgReport(HttpSession session, Model model, @RequestParam int msgNo, @RequestParam String id_send, @RequestParam String msg_content) {
		model.addAttribute("msgNo", msgNo);
		model.addAttribute("id_send", id_send);
		model.addAttribute("msg_content",msg_content);
		return "reportMsg";
	}
	
	
	@RequestMapping(value="/reportMsg.do", method=RequestMethod.GET)
	public String reportMsgDo(@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
		logger.info("report param ? " + params);
		int row = service.reportMsgDo(params);
		String msg = "";
		if(row == 1) {
			msg = "신고가 완료되었습니다.";
		}
		model.addAttribute("msg",msg);
		String id = (String) session.getAttribute("loginId");
		logger.info("msgList call : " + id);		
		ArrayList<MessageDTO> msgList = service.msgList(id);
		model.addAttribute("msgList", msgList);
		return "msgList";
	}
	
}
