package kr.co.hb.board.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.service.QboardService;

@Controller
public class QboardContrller {
	
	@Autowired QboardService service;

	@RequestMapping(value="/qBoardWrite.go")
	public String qBoardWriteForm(Model model) {		
				
		return "qBoardCreate"; 
	}
	@RequestMapping(value="/qBoardWrite.do", method = RequestMethod.POST)	
	   public String qBoardWrite(Model model,MultipartFile photo, @RequestParam HashMap<String, String> params) {
	      
		   String page = "qBoardCreate";
		  
		   if (params.get("question").equals("question_default")) {
			   model.addAttribute("msg","문의 유형을 선택하세요.");
		   }else if (params.get("qBoard_title").equals("")) {
			   model.addAttribute("msg","문의 제목을 입력 하세요.");
		   }else if (params.get("notice_content").equals("")) {
			   model.addAttribute("msg","문의 내용을 입력하세요.");
		   }else if(params.get("open_Chk").equals("")) {
			   model.addAttribute("msg","공개 여부를 선택하세요.");
		   }else {
			   service.qBoardWrite(photo, params);
			page = "redirect:/qboard.go";
		}
		   
	      return page;
	   }
	
	
}
