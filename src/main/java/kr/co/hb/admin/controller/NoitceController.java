package kr.co.hb.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.admin.dto.NoticeDTO;
import kr.co.hb.admin.service.NoticeService;

@Controller
public class NoitceController {
	
	@Autowired NoticeService service;
	
	@RequestMapping(value = "/noticeList.go")
	public String noticeList(Model model) {
		
		ArrayList<NoticeDTO> list = service.noticeList();
		model.addAttribute("list",list);
		
		return "noticeList";		
	}
	
	@RequestMapping(value = "/search.do")
	   public String noticeSearch(Model model) {      
	      
	      
	      return "noticeList.go";
	   }
	   
	   // 관리에서 등록 눌렀을떄
	   @RequestMapping(value = "/noticeWrite.go")
	   public String noticeWriteForm(Model model) {
	      
	      return "noticeCreate";
	   }
	   // 등록에서 등록버튼 눌렀을떄
	   @RequestMapping(value = "/noticeWrite.do", method = RequestMethod.POST)
	   public String noticeWrite(MultipartFile photo, @RequestParam HashMap<String, String> params) {
	      
	      return service.noticeWrite(photo, params);
	   }
	   
	   @RequestMapping(value = "/noticeDetail.do")
	   public String noticeDetail(Model model, @RequestParam String notice_idx) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = service.noticeDetail(notice_idx, "detail");
	      
	      if (dto != null) {
	         page = "noticeDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
	   
	   @RequestMapping(value = "/noticeUpdate.go")
	   public String updateForm(Model model, @RequestParam String notice_idx) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = service.noticeDetail(notice_idx, "update");
	      
	      if (dto != null) {
	         page = "noticeUpdate";
	         model.addAttribute("dto",dto);
	      }
	      
	      return page;
	   }
	   
	   @RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	   public String noticeUpdate(MultipartFile photo, 
	         @RequestParam HashMap<String, String> params) {
	      
	      return service.noticeUpdate(photo, params);
	   }
	   
	   @RequestMapping(value = "/noticeDelete.go")
	   public String noticeDelete(@RequestParam String notice_idx) {
	      service.noticeDelete(notice_idx);
	      return "redirect:/noticeList.go";
	   }
	
}
