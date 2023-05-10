package kr.co.hb.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QboardContrller {

	@RequestMapping(value="/qBoardWrite.go")
	public String qBoardWrite(Model model) {		
				
		return "qBoardCreate"; 
	}
	@RequestMapping(value="/qBoardWrite.do")
	public String qBoardWriteDo(Model model) {		
		
		return "qBoardCreate"; 
	}
	
	
}
