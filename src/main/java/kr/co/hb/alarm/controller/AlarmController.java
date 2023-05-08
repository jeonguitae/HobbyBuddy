package kr.co.hb.alarm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hb.alarm.dto.AlarmDTO;
import kr.co.hb.alarm.service.AlarmService;



@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService service;

	@RequestMapping(value="/alarmList.go")
	public String alarmList(Model model, HttpSession session) {		
		logger.info("alarmList call");
		
		String id_receive = (String) session.getAttribute("loginId");
		
		ArrayList<AlarmDTO> alarmList = service.alarmList(id_receive);
		model.addAttribute("alarmList", alarmList);
		return "redirect:/";
	}
}
