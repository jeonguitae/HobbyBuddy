package kr.co.hb.board.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;n
	
	@RequestMapping(value="/flist.go")
	public String list(Model model) {		
		logger.info("listcall");
		ArrayList<BoardDTO> list = service.list();
		
		model.addAttribute("list", list);
		return "fBoardList";
	}
}
