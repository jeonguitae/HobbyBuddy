package kr.co.hb.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	@RequestMapping(value="/reportList.go")
	public String reportList(Model model) {
		return "reportList";
	}
	
	
}
