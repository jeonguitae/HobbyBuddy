package kr.co.hb.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.admin.dto.NoticeDTO;
import kr.co.hb.admin.service.NoticeService;

@Controller
public class NoitceController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeService service;
	
	@RequestMapping(value = "/noticeList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> noticeList(
			@RequestParam String page,
			@RequestParam String cnt			
			){
		
		return service.noticePageList(Integer.parseInt(page), Integer.parseInt(cnt));
	}	
	
	@RequestMapping(value = "/update_chk.ajax", method = RequestMethod.POST)
	@ResponseBody
	public String update_chk(@RequestParam("notice_idx") String notice_idx,
	                         @RequestParam("flag") String flag) {
	  return service.notice_ChkUpdate(notice_idx, flag);
	}
	
	
	@RequestMapping(value = "/noticeList.go")
	public String noticePage() {
		return "noticeList";
	}
	
	
	@RequestMapping(value = "/search.do")
	   public String noticeSearch(Model model, @RequestParam HashMap<String, String> params) {      
	      
		logger.info("검색 컨트롤러");
		String page = "noticeResult";
		
		if (params.get("sSearch").equals("default") || params.get("notice_Search").equals("")) {
		    page = "noticeList";
		}
		
		ArrayList<NoticeDTO> list = service.noticeSearch(params);
	      
		model.addAttribute("noticePageList",list);
	      return page;
	   }
	   
	   // 관리에서 등록 눌렀을떄
	   @RequestMapping(value = "/noticeWrite.go")
	   public String noticeWriteForm(Model model) {
	      
	      return "noticeCreate";
	   }
	   // 등록에서 등록버튼 눌렀을떄
	   @RequestMapping(value = "/noticeWrite.do", method = RequestMethod.POST)
	   public String noticeWrite(Model model,MultipartFile photo, @RequestParam HashMap<String, String> params) {
	      
		   String page = "noticeCreate";
		  
		   if (params.get("notice_title").equals("")) {
			model.addAttribute("msg","제목을 입력하세요.");
		   }else if (params.get("notice_content").equals("")) {
			   model.addAttribute("msg","내용을 입력하세요.");
		   }else {
			   service.noticeWrite(photo, params);
			page = "redirect:/noticeList.go";
		}
		   
	      return page;
	   }
	   
	   @RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	   public String noticeUpdate(MultipartFile photo,@RequestParam HashMap<String, String> params) {
	      
	      return service.noticeUpdate(photo,params);
	   }
	   
	   @RequestMapping(value = "/noticeDetail.do")
	   public String noticeDetail(Model model, @RequestParam String notice_idx) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = service.noticeDetail(notice_idx, "noticeDetail");
	      
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
	   
	   @RequestMapping(value = "/noticeDelete.go")
	   public String noticeDelete(Model model,@RequestParam HashMap<String, String> params) {
	      		   
		   service.noticeDelete(params.get("notice_idx"));
	      return "redirect:/noticeList.go";
	   }
	   
	   @RequestMapping(value = "/deletePhoto.do")
       public String deletePhoto(@RequestParam String photo_idx, @RequestParam String notice_idx) {
		   logger.info("photo_idx={}, notice_idx={}", photo_idx, notice_idx);

		     
		   service.deletePhoto(photo_idx, notice_idx);
				   
	       return "redirect:/noticeUpdate.go?notice_idx=" + notice_idx;
	       
	   }
	   
	   
	
}
