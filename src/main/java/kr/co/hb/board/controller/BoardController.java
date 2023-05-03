package kr.co.hb.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value="/flist.go")
	public String flist(Model model) {		
		logger.info("listcall");
		ArrayList<BoardDTO> list = service.flist();
		model.addAttribute("list", list);
		return "fBoardList";
	}
	@RequestMapping(value="/fwrite.go")
	public String fBoardCreate(){
		logger.info("write");
		return "fBoardCreate";
	}
	
	@RequestMapping(value="/fwrite.do", method=RequestMethod.POST)
	public String fwrite(MultipartFile photo,@RequestParam HashMap<String, String> params){
		logger.info("fwrite"+params);
		return service.fwrite(photo,params);
	}
}
