package kr.co.hb.board.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.QboardDTO;



@Service
public class QboardService {

	public void qBoardWrite(MultipartFile photo, HashMap<String, String> params) {
		  String page = "redirect:/noticeList.go";
	      
	      QboardDTO dto = new QboardDTO();
	      
	      dto.setId(params.get("id"));	      
	      dto.setQboard_class(params.get("qboard_class"));
	      dto.setQboard_title(params.get("qBoard_title"));
	      
		
	}

}
