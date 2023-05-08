package kr.co.hb.alarm.controller;

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

import kr.co.hb.alarm.dto.AlarmDTO;
import kr.co.hb.alarm.service.AlarmService;



@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService service;

	@RequestMapping(value = "/alarmList.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmList(HttpSession session){		
		boolean login = false;
		String loginId = (String) session.getAttribute("loginId");
		
		int alarmCount = service.alarmCount(loginId);
		logger.info("alarmCount : "  + alarmCount);
		session.setAttribute("alarmCount", alarmCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("loginId")!= null) {
			login = true;
			logger.info("session.getAttribute(\"loginId\") : " + session.getAttribute("loginId"));
			ArrayList<AlarmDTO> alarmList = service.alarmList(loginId);
			map.put("alarmList", alarmList);
			logger.info("alarmList : "  + alarmList);
		}
		
		
		
		map.put("login", login);
		
		return map;
	}
	
	
}
