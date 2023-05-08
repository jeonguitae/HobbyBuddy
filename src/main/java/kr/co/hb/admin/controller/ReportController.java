package kr.co.hb.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hb.admin.dto.ReportDTO;
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
	
	@RequestMapping(value = "/reportDetail.go")
	   public String noticeDetail(Model model, @RequestParam String rept_no) {
	      
	      String page = "redirect:/reportList.go";
	      
	      ReportDTO dto = service.reportDetail(rept_no);
	      
	      if (dto != null) {
	         page = "reportDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
	
	@RequestMapping(value = "/report_CommentWrite.do", method = RequestMethod.POST)
	   public String report_CommentWrite(Model model, @RequestParam HashMap<String, String> params) {
	      
		   String page = "report_CommentBox";
		  
		   if (params.get("proc_content").equals("")) {
			model.addAttribute("msg","처리사유를 입력하세요.");
		   }else {
			   service.commentWrite(params);
			page = "redirect:/reportCommentDetail.go";
		}
		   
	      return page;
	   }
	
	@RequestMapping(value = "/reportCommentDetail.go")
	public String reportCommentDetail(Model model, @RequestParam int rept_no) {
	      
	      String page = "redirect:/reportList.go";
	      
	      ReportDTO dto = service.reportCommentDetail(rept_no);
	      
	      if (dto != null) {
	         page = "reportCommentDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
}
