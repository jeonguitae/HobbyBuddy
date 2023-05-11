package kr.co.hb.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dao.QboardDAO;
import kr.co.hb.board.dto.QboardDTO;



@Service
public class QboardService {

	@Autowired QboardDAO dao;
	
	String root = "C:/img/upload/";	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*
	 * public void qBoardWrite(MultipartFile photo, HashMap<String, String> params)
	 * { String page = "redirect:/noticeList.go";
	 * 
	 * QboardDTO dto = new QboardDTO();
	 * 
	 * dto.setId(params.get("id")); dto.setQboard_class(params.get("qboard_class"));
	 * dto.setQboard_title(params.get("qBoard_title"));
	 * 
	 * 
	 * }
	 */

	public HashMap<String, Object> qboard_write(MultipartFile photo, HashMap<String, String> params) {
	
	QboardDTO dto = new QboardDTO();
	
	dto.setId(params.get("id"));
	dto.setQboard_class(params.get("qboard_class"));
	dto.setQboard_title(params.get("qboard_title"));
	dto.setQboard_content(params.get("qboard_content"));
	if (params.get("qboard_openchk") == "true") {
	    dto.setQboard_openchk(true);
	} else {
	    dto.setQboard_openchk(false);
	}
	
	int board_num = dto.getQboard_no();	
	
	
	if (!photo.getOriginalFilename().equals("")) {
        qboardFileSave(board_num, photo);
     }
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	int row = dao.qboard_write(dto);
	map.put("success", row);
	
	return map;
	
	}

	private void qboardFileSave(int board_num, MultipartFile photo) {
		String ori_photo_name = photo.getOriginalFilename();
	      
        String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));

        String new_photo_name = System.currentTimeMillis()+ext;

        try {

           byte[] bytes = photo.getBytes();

           Path path = Paths.get("C:/img/upload/" + new_photo_name);
           	            	    
           Files.write(path, bytes);
           logger.info("a" +photo);
           
           String board_class = "고객센터";          
           
           
           dao.qboardFileSave(board_num,board_class, ori_photo_name,new_photo_name);
           
           
        } catch (IOException e) {

           e.printStackTrace();
        }
		
	}

	

	

}
