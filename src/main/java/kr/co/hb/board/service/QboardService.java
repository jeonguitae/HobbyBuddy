package kr.co.hb.board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
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
	
	
	logger.info("서비스 도착");
	dto.setId(params.get("id"));
	dto.setQboard_class(params.get("qboard_class"));
	dto.setQboard_title(params.get("qboard_title"));
	dto.setQboard_content(params.get("qboard_content"));
	
	boolean qboardOpenchk = Boolean.parseBoolean(params.get("qboard_openchk"));
	if (qboardOpenchk) {
		dto.setQboard_openchk(true);
	} else {
		dto.setQboard_openchk(false);
	}
	
	int row = dao.qboard_write(dto);
	
	int board_num = dto.getQboard_no();
	
	logger.info("서비스 boardnum : " + board_num);
	String id = dto.getId();
	
	
	if (!photo.getOriginalFilename().equals("")) {
        qboardFileSave(id,board_num, photo);
     }
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	
	
	map.put("success", row);
	
	return map;
	
	}

	private void qboardFileSave(String id, int board_num, MultipartFile photo) {
		String ori_photo_name = photo.getOriginalFilename();
	      
        String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));

        String new_photo_name = System.currentTimeMillis()+ext;
        
        logger.info("board num : filesave" + board_num);

        try {
        	
        	logger.info("board num : filesave" + board_num);
        	
           byte[] bytes = photo.getBytes();

           Path path = Paths.get("C:/img/upload/" + new_photo_name);
           	            	    
           Files.write(path, bytes);
           logger.info("a" +photo);
           
           String board_class = "고객센터";          
           
           
           dao.qboardFileSave(id, board_num, board_class, ori_photo_name, new_photo_name);
           
           
        } catch (IOException e) {

           e.printStackTrace();
        }
		
	}

	public HashMap<String, Object> qboardPageList(int page, int cnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * cnt;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.totalCount();
		int range = total%cnt == 0 ? total/cnt : (total/cnt) + 1;
		
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		ArrayList<QboardDTO> qboardPageList = dao.qboardPageList(cnt, offset);
		
		map.put("qboardPageList", qboardPageList);
		
		return map;
	}

	public QboardDTO qboardDetail(String qboard_no) {
		
		logger.info("서비스 디테일 등장");
		
		return dao.qboardDetail(qboard_no);
	}

	public String qboardUpdate(MultipartFile photo, HashMap<String, String> params) {
		int row = dao.qboardUpdate(params);
	      int board_num = Integer.parseInt(params.get("qboard_no"));	
	      
	      String id = params.get("id");
	      
	      if (photo != null && !photo.getOriginalFilename().equals("")) {
	    	    qboardFileSave(id,board_num, photo);
	    	    
	    	}     
	      
	      String page = row > 0 ? "redirect:/qboardDetail.go?qboard_no=" + board_num : "redirect:/qboardList.go";
	             
	        return page;
	}

	public void qboardDelete(String qboard_no) {
		String new_photo_name = dao.qboardFindFile(qboard_no);
	      
	      int row = dao.qboardDelete(qboard_no);
	            
	      
	      if (new_photo_name != null) {
	         if (row>0) {
	            File file = new File("C:/img/upload/"+ new_photo_name);
	            if (file.exists()) {
	               file.delete();
	            }
	         }
	      }
		
	}

	public void deletePhoto(String photoIdx, String qboard_no) {
		logger.info(photoIdx);
		String new_photo_name = dao.noticeFindFile2(photoIdx);
		
	    if (new_photo_name != null) {
	        	
	        File files = new File("C:/img/upload/" + new_photo_name);
	        if (files.exists()) {
	        	logger.info("2");
	            files.delete();
	            dao.deletePhoto(photoIdx,qboard_no); // photo_idx 파라미터 사용
	        }
	        
	    }
		
	}

	

	

}
