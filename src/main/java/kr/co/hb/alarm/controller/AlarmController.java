package kr.co.hb.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hb.alarm.dto.AlarmDTO;
import kr.co.hb.alarm.service.AlarmService;
import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;



@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService service;
	@Autowired BoardService bservice;

	@RequestMapping(value = "/alarmList.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmList(HttpSession session){		
		boolean login = false;
		String loginId = (String) session.getAttribute("loginId");
		
		int alarmCount = service.alarmCount(loginId);
		logger.info("alarmCount : "  + alarmCount);
		session.setAttribute("alarmCount", alarmCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("loginId") != null) {
		    login = true;
		    logger.info("session.getAttribute(\"loginId\") : " + session.getAttribute("loginId"));
		    ArrayList<AlarmDTO> alarmList = service.alarmList(loginId);

		    // AlarmDTO 객체와 관련된 작업은 alarmList가 null이 아닌 경우에만 수행
		    if (alarmList != null) {
		        for (AlarmDTO dto : alarmList) {
		            String alarm_title = dto.getAlarm_title();
		            String newalarm_title = alarm_title.substring(0, 7);
		            dto.setAlarm_title(newalarm_title + "...");

		            String alarm_content = dto.getAlarm_content();
		            String newalarm_content = alarm_content.substring(0, 7);
		            dto.setAlarm_content(newalarm_content + "...");
		        }
		    }

		    map.put("alarmList", alarmList);
		    logger.info("alarmList : " + alarmList);
		}
		map.put("login", login);
		
		return map;
	}
		
	@RequestMapping(value="/beforeAlarm.go")
	public String beforeAlarm(Model model, HttpSession session) {		
		logger.info("listcall");
		String id = (String) session.getAttribute("loginId");
		ArrayList<AlarmDTO> alarmList = service.beforeAlarm(id);
		model.addAttribute("alarmList", alarmList);
		return "alarmList";
	}
	
	@RequestMapping(value="/alarmListRead.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmListRead(@RequestParam(value="alarmListRead[]") ArrayList<String> alarmListRead){
		//array 로 받을 경우 @RequestParam 에 value 를 반드시 명시해야함
		logger.info("alarmListRead : "+alarmListRead);
		return service.alarmListRead(alarmListRead);
	}
	
	@RequestMapping(value="/alarmDetail.do")
	public String alarmDetail(Model model, @RequestParam int alarm_num, @RequestParam String alarm_class, @RequestParam ArrayList<String> alarm_no) {
		logger.info("alarmDetail" + alarm_num + " / " + alarm_class);
		String page = "main";
		if(alarm_class.equals("자유")) {
			BoardDTO dto = bservice.detail(alarm_num, "detail");
			model.addAttribute("dto",dto);
			service.alarmListRead(alarm_no);
			page = "fBoardDetail";
		}
		
		return page;
	}
	
}
