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

import kr.co.hb.admin.dto.ReportDTO;
import kr.co.hb.admin.service.ReportService;
import kr.co.hb.board.controller.BoardController;
import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;
import kr.co.hb.message.dto.MessageDTO;

@Controller
public class ReportController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReportService service;
	@Autowired BoardService bservice;
	
	@RequestMapping(value="/report_msg_profileList.go")
	public String report_msg_profileList(Model model) {
		return "report_msg_profileList";
	}
	
	@RequestMapping(value="/report_fboardList.go")
	public String report_fboardList(Model model) {
		return "report_fboardList";
	}
	
	@RequestMapping(value="/report_gboardList.go")
	public String report_gboardList(Model model) {
		return "report_gboardList";
	}
	
	@RequestMapping(value = "/profileList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> reportList(
			@RequestParam String page,
			@RequestParam String search			
			){
		
		return service.report_profileList(Integer.parseInt(page), search);
	}	
	
	@RequestMapping(value = "/msgList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> reportmsgList(
			@RequestParam String page,
			@RequestParam String search			
			){
		
		return service.report_msgList(Integer.parseInt(page), search);
	}	
	
	@RequestMapping(value = "/report_fboardList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> report_fboardList(
			@RequestParam String page,
			@RequestParam String search			
			){
		
		return service.report_fboardList(Integer.parseInt(page), search);
	}	
	
	@RequestMapping(value = "/report_gboardList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> report_gboardList(
			@RequestParam String page,
			@RequestParam String search			
			){
		
		return service.report_gboardList(Integer.parseInt(page), search);
	}	
	
	@RequestMapping(value = "/report_msg_profileDetail.go")
	   public String report_msg_profileDetail(Model model, @RequestParam String rept_no) {
	      
	      String page = "redirect:/reportList.go";
	      
	      ReportDTO dto = service.report_msg_profileDetail(rept_no);
	      
	      if (dto != null) {
	         page = "report_msg_profileDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
	@RequestMapping(value = "/report_fboardDetail.go")
	public String report_fboardetail(Model model, @RequestParam String rept_no) {
		
		String page = "redirect:/report_fboardList.go";
		
		ReportDTO dto = service.report_fboardDetail(rept_no);
		
		if (dto != null) {
			page = "report_fboardDetail";
			model.addAttribute("dto", dto);
		}
		
		return page;
	}
	
	@RequestMapping(value = "/report_gboardDetail.go")
	public String report_gboardetail(Model model, @RequestParam String rept_no) {
		
		String page = "redirect:/report_gboardList.go";
		
		ReportDTO dto = service.report_gboardDetail(rept_no);
		
		if (dto != null) {
			page = "report_gboardDetail";
			model.addAttribute("dto", dto);
		}
		
		return page;
	}
	
	@RequestMapping(value = "/report_pCommentWrite.do", method = RequestMethod.POST)
	public String report_pCommentWrite(Model model, @RequestParam HashMap<String, String> params) {

	    String page = "report_msg_profileDetail";

	    logger.info("컨트롤러 입장");
	    if (params.get("admin_id").equals("")) {
			page = "redirect:/report_msg_profileDetail.go?rept_no=" + params.get("rept_no");
	        model.addAttribute("msg","세션이 종료되었습니다. 다시 로그인 해주세요.");
		}else if (params.get("proc_content").equals("")) {	        
	        page = "redirect:/report_msg_profileDetail.go?rept_no=" + params.get("rept_no");
	        model.addAttribute("msg","처리사유를 입력하세요.");
	    }else if (params.get("rept_state").equals("선택")) {
	    	page = "redirect:/report_msg_profileDetail.go?rept_no=" + params.get("rept_no");
	        model.addAttribute("msg","처리상태를 선택하세요.");
		}else {
	        logger.info("업데이트 컨트롤러 메소드 실행");
	        service.pcommentWrite(params);
	        page = "redirect:/report_msg_profileList.go";
	    }
	    
	    return page;
	}	
	
	@RequestMapping(value = "/report_fCommentWrite.do", method = RequestMethod.POST)
	public String report_fCommentWrite(Model model, @RequestParam HashMap<String, String> params) {
		
		String page = "report_fboardDetail";
		
		logger.info("컨트롤러 입장");
		if (params.get("admin_id").equals("")) {
			page = "redirect:/report_fboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","세션이 종료되었습니다. 다시 로그인 해주세요.");
		}else if (params.get("proc_content").equals("")) {	        
			page = "redirect:/report_fboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","처리사유를 입력하세요.");
		}else if (params.get("rept_state").equals("선택")) {
			page = "redirect:/report_fboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","처리상태를 선택하세요.");
		}else {
			logger.info("업데이트 컨트롤러 메소드 실행");
			service.fcommentWrite(params);
			page = "redirect:/report_fboardList.go";
		}
		
		return page;
	}	
	
	@RequestMapping(value = "/report_gCommentWrite.do", method = RequestMethod.POST)
	public String report_mCommentWrite(Model model, @RequestParam HashMap<String, String> params) {
		
		String page = "report_gboardDetail";
		
		logger.info("컨트롤러 입장");
		if (params.get("admin_id").equals("")) {
			page = "redirect:/report_gboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","세션이 종료되었습니다. 다시 로그인 해주세요.");
		}else if (params.get("proc_content").equals("")) {	        
			page = "redirect:/report_gboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","처리사유를 입력하세요.");
		}else if (params.get("rept_state").equals("선택")) {
			page = "redirect:/report_gboardDetail.go?rept_no=" + params.get("rept_no");
			model.addAttribute("msg","처리상태를 선택하세요.");
		}else {
			logger.info("업데이트 컨트롤러 메소드 실행");
			service.gcommentWrite(params);
			page = "redirect:/report_gboardList.go";
		}
		
		return page;
	}
	
	@RequestMapping(value = "/reportComent.go", method = RequestMethod.GET)
	public String reportComent(HttpSession session, Model model, 
			@RequestParam int reptboard_num, @RequestParam String reporter, @RequestParam String rept_content, @RequestParam int coNo) {
		model.addAttribute("reptboard_num", reptboard_num);
		model.addAttribute("reporter", reporter);
		model.addAttribute("rept_content",rept_content);
		model.addAttribute("coNo",coNo);
		return "reportComent";
	}
	
	@RequestMapping(value="/reportComent.do", method=RequestMethod.GET)
	public String reportComentdo(@RequestParam HashMap<String, String> params, @RequestParam int reptboard_num, HttpSession session, Model model) {
		logger.info("reportComentdo param ? " + params);
		int row = service.reportComentdo(params);
		String msg = "";
		if(row == 1) {
			msg = "신고가 완료되었습니다.";
			model.addAttribute("msg", msg);
		}
		
		BoardDTO dto=bservice.detail(reptboard_num,"detail");
		
		if (dto != null) {
			model.addAttribute("dto",dto);
			model.addAttribute("fbNo",reptboard_num);
		}

		session.setAttribute("fbNo", reptboard_num);
		
		ArrayList<BoardDTO> coList = new ArrayList<BoardDTO>();
		coList=bservice.coList(reptboard_num);
		model.addAttribute("coList",coList);
		
		
		
		return "fBoardDetail";
	}
}
