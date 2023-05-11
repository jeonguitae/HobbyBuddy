package kr.co.hb.board.controller;

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

import kr.co.hb.board.service.QboardService;

@Controller
public class QboardContrller {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired QboardService service;

	@RequestMapping(value="/qBoardWrite.go")
	public String qBoardWriteForm(Model model) {		
				
		return "qBoardCreate"; 
	}
	@RequestMapping(value = "/qboard_write.ajax",method = RequestMethod.POST)
	// ajasx형태로 주고 받기 위해 작성
	@ResponseBody
	public HashMap<String, Object> join(MultipartFile photo ,@RequestParam HashMap<String, String> params){
		logger.info("정보들 컨트롤러에 도착 : {}", params);
		return service.qboard_write(photo,params);
	}
	
	
}
