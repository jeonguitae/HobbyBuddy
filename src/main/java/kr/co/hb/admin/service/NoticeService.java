package kr.co.hb.admin.service;

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

import kr.co.hb.admin.dao.NoticeDAO;
import kr.co.hb.admin.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired NoticeDAO dao;
	
	String root = "C:/img/upload/";	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	 	public String noticeUpdate(MultipartFile photo, HashMap<String, String> params) {
	      
	      int row = dao.noticeUpdate(params);
	      int board_num = Integer.parseInt(params.get("notice_idx"));	
	      
	      String id = params.get("id");
	      
	      if (photo != null && !photo.getOriginalFilename().equals("")) {
	    	    noticeFileSave(id, board_num, photo);
	    	}     
	      
	      String page = row > 0 ? "redirect:/noticeDetail.go?notice_idx=" + board_num : "redirect:/noticeList.go";
	             
	      	      
	        return page;
	   }

	   public String noticeWrite(MultipartFile photo, HashMap<String, String> params) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = new NoticeDTO();
	      
	      dto.setId(params.get("id"));
	      dto.setNotice_title(params.get("notice_title"));
	      dto.setNotice_content(params.get("notice_content"));
	      
	      dao.noticeWrite(dto);
	      
	      
	      
	      int board_num = dto.getNotice_idx();
	      
	      String id = dto.getId();
	      
	      if (photo != null && !photo.getOriginalFilename().equals("")) {
	    	   noticeFileSave(id, board_num, photo);
	    	}
	
	      
	      return page;
	   }

	   private void noticeFileSave(String id, int board_num, MultipartFile file) {

	      String ori_photo_name = file.getOriginalFilename();
	      
	         String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));

	         String new_photo_name = System.currentTimeMillis()+ext;

	         try {

	            byte[] bytes = file.getBytes();

	            Path path = Paths.get("C:/img/upload/" + new_photo_name);
	            	            	    
	            Files.write(path, bytes);
	            logger.info("a" +file);
	            
	            String board_class = "공지사항";
	            
	            dao.noticeFileWrite(id, board_num, board_class, ori_photo_name,new_photo_name);
	            
	            
	         } catch (IOException e) {

	            e.printStackTrace();
	         }

	      }
	   
	   
	   public String notice_ChkUpdate(String notice_idx, String flag) {
		   if (flag.equals("true")) {
		     dao.notice_ChkOn(notice_idx);
		   } else {
		     dao.notice_ChkOff(notice_idx);
		   }
		   return flag;
		 }

	   public NoticeDTO noticeDetail(int notice_idx, String flag) {
	      
	      if(flag.equals("noticeDetail")) {
	            // 조회수 증가
	            dao.noticeUpHit(notice_idx);
	         }
	      
	      return dao.noticeDetail(notice_idx);
	   }

	   public ArrayList<NoticeDTO> noticeList() {
	      
	      return dao.noticeList();
	   }  

	   public void noticeDelete(String notice_idx) {
	      
	      String new_photo_name = dao.noticeFindFile(notice_idx);
	      
	      int row = dao.noticeDelete(notice_idx);
	            
	      
	      if (new_photo_name != null) {
	         if (row>0) {
	            File file = new File("C:/img/upload/"+ new_photo_name);
	            if (file.exists()) {
	               file.delete();
	            }
	         }
	      }

	   }

	public ArrayList<NoticeDTO> noticeSearch(HashMap<String, String> params) {
		
		ArrayList<NoticeDTO> list = null;
		
		if(params.get("sSearch").equals("notice_title")) {
			String wildcard = "%" + params.get("notice_Search") + "%";
			params.replace("notice_Search", wildcard);
			list = dao.noticeTitle(params);
		}
		
		if(params.get("sSearch").equals("id")) {
			
			String wildcard = "%" + params.get("notice_Search") + "%";
			params.replace("notice_Search", wildcard);
			list = dao.noticeId(params);
		}		
		
		return list;
	}

	public HashMap<String, Object> noticePageList(int page, String search) {
		
		
	 logger.info("서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.totalCount();
		
		
		if (search.equals("default") || search.equals("")) {
	         total = dao.totalCount();
	         logger.info("서비스1");
	         
	      } else {
	         total = dao.ntotalCountSearch(search);
	         logger.info("서비스2");
	      };	
		
		
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		ArrayList<NoticeDTO> nolist = dao.nolist(10, offset);
		
		if (search.equals("default") || search.equals("")) {
			nolist = dao.nolist(10, offset);
			logger.info("서비스3");
	         
	      } else {
	    	  nolist = dao.nolistSearch(search);
	    	  logger.info("서비스4");
	      }
		
		map.put("currPage", page);
		map.put("pages", range);		
		
		map.put("nolist", nolist);
		

		return map;
	}

	public void deletePhoto(String photoIdx, String notice_idx) {
		
		logger.info(photoIdx);
		String new_photo_name = dao.noticeFindFile2(photoIdx);
		
	    if (new_photo_name != null) {
	        	
	        File files = new File("C:/img/upload/" + new_photo_name);
	        if (files.exists()) {
	        	logger.info("2");
	            files.delete();
	            dao.deletePhoto(photoIdx,notice_idx); // photo_idx 파라미터 사용
	        }
	        
	    }
	}

	public ArrayList<NoticeDTO> pro_select() {
		return dao.pro_select();
	}

	public void noticeAlarm(String id_send, String id_receive, String alarm_title, String alarm_content,
			String alarm_class, String alarm_num) {
		dao.noticeAlarm(id_send,id_receive,alarm_title,alarm_content,alarm_class,alarm_num);
		
	}

	public NoticeDTO noticeDetail1(int notice_idx) {
		// TODO Auto-generated method stub
		return dao.noticeDetail1(notice_idx);
	}



}
