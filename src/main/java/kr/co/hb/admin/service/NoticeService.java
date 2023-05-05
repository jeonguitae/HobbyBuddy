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
import kr.co.hb.group.dto.GroupBoardDTO;

@Service
public class NoticeService {

	@Autowired NoticeDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	 	public String noticeUpdate(MultipartFile photo, HashMap<String, String> params) {
	      
	      int row = dao.noticeUpdate(params);
	      int idx = Integer.parseInt(params.get("notice_idx"));	
	      
	      if (!photo.getOriginalFilename().equals("")) {
		         noticeFileSave(idx, photo);
		      }	      
	      
	      String page = row > 0 ? "redirect:/noticeDetail.do?notice_idx=" + idx : "redirect:/noticeList.go";
	             
	        return page;
	   }

	   public String noticeWrite(MultipartFile photo, HashMap<String, String> params) {
	      
	      String page = "redirect:/noticeList.go";
	      
	      NoticeDTO dto = new NoticeDTO();
	      
	      dto.setId(params.get("id"));	      
	      dto.setNotice_title(params.get("notice_title"));
	      dto.setNotice_content(params.get("notice_content"));
	      
	      dao.noticeWrite(dto);
	      
	      int idx = dto.getNotice_idx();
	      
	      if (!photo.getOriginalFilename().equals("")) {
	         noticeFileSave(idx, photo);
	      }
	      
	      return page;
	   }

	   private void noticeFileSave(int idx, MultipartFile file) {

	      String oriFileName = file.getOriginalFilename();
	      
	         String ext = oriFileName.substring(oriFileName.lastIndexOf("."));

	         String newFileName = System.currentTimeMillis()+ext;

	         try {

	            byte[] bytes = file.getBytes();

	            Path path = Paths.get("C:/img/upload/" + newFileName);
	            	            	    
	            Files.write(path, bytes);
	            
	            dao.noticeFileWrite(idx,oriFileName,newFileName);
	            
	            
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

	   public NoticeDTO noticeDetail(String notice_idx, String flag) {
	      
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
	      
	      String newFileName = dao.noticeFindFile(notice_idx);
	      
	      int row = dao.noticeDelete(notice_idx);
	            
	      
	      if (newFileName != null) {
	         if (row>0) {
	            File file = new File("C:/img/upload/"+ newFileName);
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

	public HashMap<String, Object> noticePageList(int page, int cnt) {
		
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
		
		ArrayList<NoticeDTO> noticePageList = dao.noticePageList(cnt, offset);
		
		map.put("noticePageList", noticePageList);
		
		return map;
	}

	public void deletePhoto(String photo_idx, String notice_idx) {
		
		logger.info(photo_idx);
		String newFileName = dao.noticeFindFile2(photo_idx);
		
	    if (newFileName != null) {
	        	
	        File files = new File("C:/img/upload/" + newFileName);
	        if (files.exists()) {
	        	logger.info("2");
	            files.delete();
	            dao.deletePhoto(photo_idx,notice_idx); // photo_idx 파라미터 사용
	        }
	        
	    }
	}
	



}
