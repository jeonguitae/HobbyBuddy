package kr.co.hb.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hb.admin.service.ReportService;

@Controller
public class ReportController {

	@Autowired ReportService service;
	
	@RequestMapping(value="/reportList.go")
	public String reportList(Model model) {
		return "reportList";
	}
	
	@RequestMapping(value = "/reportList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> reportList(
			@RequestParam String page,
			@RequestParam String cnt			
			){
		
		return service.reportPageList(Integer.parseInt(page), Integer.parseInt(cnt));
	}	
}
