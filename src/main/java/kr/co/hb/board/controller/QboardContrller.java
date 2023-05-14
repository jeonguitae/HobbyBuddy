package kr.co.hb.board.controller;

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

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kr.co.hb.board.dto.QboardDTO;
import kr.co.hb.board.service.QboardService;

@Controller
public class QboardContrller {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired QboardService service;

	@RequestMapping(value = "/qboardList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> qboardList(
			@RequestParam String page,
			@RequestParam String cnt			
			){
		
		return service.qboardPageList(Integer.parseInt(page), Integer.parseInt(cnt));
	}	
	
	
	@RequestMapping(value="/qboardList.go")
	public String qboardList(Model model) {		
				
		return "qBoardList"; 
	}
	
	@RequestMapping(value="/qBoardWrite.go")
	public String qBoardWriteForm(Model model) {		
		
		return "qBoardCreate"; 
	}
	
	@RequestMapping(value = "/qboard_write.ajax",method = RequestMethod.POST)
	// ajasx형태로 주고 받기 위해 작성
	@ResponseBody
	public HashMap<String, Object> qboard_write(MultipartFile photo ,@RequestParam HashMap<String, String> params){
		logger.info("정보들 컨트롤러에 도착 : {}", params);
		
		logger.info("parmas true + " + params.get("qboard_openchk"));
		return service.qboard_write(photo,params);
	}
	
	@RequestMapping(value = "/qboardDetail.go")
	   public String qboardDetail(Model model, @RequestParam String qboard_no) {
	      
	      String page = "redirect:/qboardList.go";
	      
	      QboardDTO dto = service.qboardDetail(qboard_no);
	      
	      if (dto != null) {
	         page = "qBoardDetail";
	         model.addAttribute("dto", dto);
	      }
	      
	      return page;
	   }
	 @RequestMapping(value = "/qboardUpdate.do", method = RequestMethod.POST)
	   public String qboardUpdate(HttpSession session,Model model ,MultipartFile photo,@RequestParam HashMap<String, String> params) {
	      
		 if (params.get("qboard_title") != null) {
			model.addAttribute("msg","문의 제목을 입력하세요.");
		}else if (params.get("qboard_content") != null) {
			model.addAttribute("msg","문의 내용을 입력하세요.");
		}
		 
		 
	      return service.qboardUpdate(photo,params);
	   }
	 
	 @RequestMapping(value = "/qboardUpdate.go")
	   public String QupdateForm(Model model, @RequestParam String qboard_no) {
	      
		 logger.info("업데이트 컨트롤러 등장");
		 
	      String page = "redirect:/qboardList.go";
	      
	      QboardDTO dto = service.qboardDetail(qboard_no);
	      
	      if (dto != null) {
	    	  logger.info("업데이트 가자는 컨트롤러");
	         page = "qBoardUpdate";
	         model.addAttribute("dto",dto);
	      }
	      
	      return page;
	   }	   
	   
	   @RequestMapping(value = "/qboardDelete.go")
	   public String qboardDelete(Model model,@RequestParam HashMap<String, String> params) {
	      		   
		   service.qboardDelete(params.get("qboard_no"));
	      return "redirect:/qboardList.go";
	   }
	   
	   @RequestMapping(value = "/QdeletePhoto.do")
     public String deletePhoto(@RequestParam String photoIdx, @RequestParam String qboard_no) {
		   logger.info("photoIdx={}, qboard_no={}", photoIdx, qboard_no);

		     
		   service.deletePhoto(photoIdx, qboard_no);
				   
	       return "redirect:/qboardUpdate.go?qboard_no=" + qboard_no;
	       
	}
	@RequestMapping(value = "/qBoard_replyWrite.do")  
	public String qBoard_replyWrite(@RequestParam HashMap<String, String> params) {
	      
		logger.info("여긴오나?");
		
	      return service.qBoard_replyWrite(params);
	   }	
	
	@RequestMapping(value = "/qboardSecretSet.do")
	   public String qboardSecretSet(Model model,@RequestParam HashMap<String, String> params) {
	      		   
		logger.info("컨트롤러");
		
		  String writer_id = params.get("writer_id");
		  String admin_id = params.get("admin_id");
		  String sboard_class = "고객센터";
		  String sboard_title = params.get("sboard_title");
		  String sboard_num = params.get("sboard_num");
		
		   service.qboardSecretSet(writer_id,admin_id,sboard_class,sboard_title,sboard_num);
	      return "redirect:/qboardList.go";
	   }
	   
}
