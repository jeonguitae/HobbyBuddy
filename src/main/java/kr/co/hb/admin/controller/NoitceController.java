package kr.co.hb.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.admin.dto.NoticeDTO;
import kr.co.hb.admin.service.NoticeService;

@Controller
public class NoitceController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeService service;
	
	@RequestMapping(value = {"/noticeList.ajax"}, method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> noticeList(
			@RequestParam String page,
			@RequestParam String cnt			
			){
		
		return service.noticePageList(Integer.parseInt(page), Integer.parseInt(cnt));
	}	
	
	@RequestMapping(value = "/update_chk.ajax", method = RequestMethod.POST)
	@ResponseBody
	public String update_chk(@RequestParam("notice_idx") String notice_idx, HttpSession session, @RequestParam String notice_chk,
			@RequestParam("flag") String flag,@RequestParam("notice_title") String notice_title,@RequestParam("notice_content") String notice_content) {
	    logger.info("notice_chk : " + notice_chk);

		if(notice_chk.equals("true")) {
			ArrayList<NoticeDTO> dto = service.pro_select();
			
			logger.info("pro_select : " + dto);
			if(dto != null) {
				logger.info("pro_select : " + dto);	
				logger.info("pro_select : " + dto.size());	
				
				for (NoticeDTO noticeDTO : dto) {
					String id_send = (String) session.getAttribute("loginId");
					String id_receive = noticeDTO.getId();
					String alarm_title = notice_title;
					String alarm_content = notice_content;
					String alarm_class = "공지";
					String alarm_num = notice_idx;
					
					logger.info("전 : " + id_send+id_receive+alarm_title+alarm_content+alarm_class+alarm_num);
					
					service.noticeAlarm(id_send,id_receive,alarm_title,alarm_content,alarm_class,alarm_num);
					
					logger.info("후 : " + id_send+id_receive+alarm_title+alarm_content+alarm_class+alarm_num);
					
				}
			}
		}
		
		
		return service.notice_ChkUpdate(notice_idx, flag);
	}
	
	
	@RequestMapping(value = {"/noticeList.go","/nboard.go"})
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
		   }else if(params.get("id").equals("")){
			   model.addAttribute("msg","세션이 만료되었습니다. 다시 로그인해주세요.");
		   }else {
			   model.addAttribute("msg","정상적으로 작성 되었습니다.");
			   service.noticeWrite(photo, params);
			page = "noticeList";
		}
		   
	      return page;
	   }
	   
	   @RequestMapping(value = "/noticeUpdate.do", method = RequestMethod.POST)
	   public String noticeUpdate(MultipartFile photo,@RequestParam HashMap<String, String> params) {
	      
	      return service.noticeUpdate(photo,params);
	   }
	   
	   @RequestMapping(value = "/noticeDetail.go")
	   public String noticeDetail(Model model, @RequestParam int notice_idx) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = service.noticeDetail(notice_idx, "noticeDetail");
	      
	      if (dto != null) {
	         page = "noticeDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
	   
	   @RequestMapping(value = "/noticeUpdate.go")
	   public String updateForm(Model model, @RequestParam int notice_idx) {
	      
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
       public String deletePhoto(@RequestParam String photoIdx, @RequestParam String notice_idx) {
		   logger.info("photo_idx={}, notice_idx={}", photoIdx, notice_idx);

		     
		   service.deletePhoto(photoIdx, notice_idx);
				   
	       return "redirect:/noticeUpdate.go?notice_idx=" + notice_idx;
	       
	   }
	   
	   
	
}
