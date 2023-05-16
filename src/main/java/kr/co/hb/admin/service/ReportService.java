package kr.co.hb.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.admin.dao.ReportDAO;
import kr.co.hb.admin.dto.ReportDTO;

@Service
public class ReportService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ReportDAO dao;
	
	public HashMap<String, Object> report_profileList(int page, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.profileTotalCount();
		
		if (search.equals("default") || search.equals("")) {
	         total = dao.profileTotalCount();
	         logger.info("서비스1");
	         
	      } else {
	         total = dao.ptotalCountSearch(search);
	         logger.info("서비스2");
	      };
	      
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		
		
		ArrayList<ReportDTO> report_profileList = dao.report_profileList(10, offset);
		
		if (search.equals("default") || search.equals("")) {
			report_profileList = dao.report_profileList(10, offset);
			logger.info("서비스3");
	         
	      } else {
	    	  report_profileList = dao.profileSearch(search);
	    	  logger.info("서비스4");
	      }
		
		map.put("currPage", page);
		map.put("pages", range);
		map.put("report_profileList", report_profileList);
		
		
		return map;
	}
	
	public HashMap<String, Object> report_msgList(int page, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.msgTotalCount();
		
		if (search.equals("default") || search.equals("")) {
	         total = dao.msgTotalCount();
	         logger.info("서비스1");
	         
	      } else {
	         total = dao.msgTotalCountSearch(search);
	         logger.info("서비스2");
	      };	
	      
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		
		
		ArrayList<ReportDTO> report_msgList = dao.report_msgList(10, offset);
		
		if (search.equals("default") || search.equals("")) {
			report_msgList = dao.report_msgList(10, offset);
			logger.info("서비스3");
	         
	      } else {
	    	  report_msgList = dao.msgSearch(search);
	    	  logger.info("서비스4");
	      }
		map.put("currPage", page);
		map.put("pages", range);
		map.put("report_msgList", report_msgList);
		
		
		return map;
	}

	public ReportDTO report_msg_profileDetail(String rept_no) {
		return dao.report_msg_profileDetail(rept_no);
	}
	
	public ReportDTO report_fboardDetail(String rept_no) {
		return dao.report_fboardDetail(rept_no);
	}
	
	public ReportDTO report_gboardDetail(String rept_no) {
		return dao.report_gboardDetail(rept_no);
	}

	public String commentWrite(HashMap<String, String> params) {
		
		logger.info("서비스 도착");
		
		  String page = "redirect:/reportList.go";       
	      
	      dao.commentWrite(params);	            

	      return page;      
	      
	}

	public ReportDTO reportCommentDetail(int rept_no) {
		return dao.reportCommentDetail(rept_no);
	}

	public HashMap<String, Object> report_fboardList(int page, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.fTotalCount();
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		
		
		ArrayList<ReportDTO> report_fboardList = dao.report_fboardList(10, offset);
		
		if (search.equals("default") || search.equals("")) {
			report_fboardList = dao.report_fboardList(10, offset);
			logger.info("서비스3");
	         
	      } else {
	    	  report_fboardList = dao.fboardSearch(search);
	    	  logger.info("서비스4");
	      }
		
		map.put("currPage", page);
		map.put("pages", range);
		
		map.put("report_fboardList", report_fboardList);
		
		
		return map;
	}

	public HashMap<String, Object> report_gboardList(int page, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.gTotalCount();
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		
		
		ArrayList<ReportDTO> report_gboardList = dao.report_gboardList(10, offset);

		
		if (search.equals("default") || search.equals("")) {
	         total = dao.gTotalCount();
	         logger.info("서비스1");
	         
	      } else {
	         total = dao.gTotalCountSearch(search);
	         logger.info("서비스2");
	      };
	      
		map.put("currPage", page);
		map.put("pages", range);
		map.put("report_gboardList", report_gboardList);
		
		
		return map;
	}

	public String pcommentWrite(HashMap<String, String> params) {
		  logger.info("서비스 도착");
		
		  String page = "redirect:/report_msg_profileList.go";       
	      
	      dao.pcommentWrite(params);	            

	      return page;
		
	}

	public String fcommentWrite(HashMap<String, String> params) {
		
		   logger.info("서비스 도착");
		
		  String page = "redirect:/report_fboardList.go";       
	      
	      dao.fcommentWrite(params);	            

	      return page;
		
	}

	public String gcommentWrite(HashMap<String, String> params) {
		logger.info("서비스 도착");
		
		  String page = "redirect:/report_gboardList.go";       
	      
	      dao.gcommentWrite(params);	            

	      return page;
		
	}

	public int reportComentdo(HashMap<String, String> params) {
		return dao.reportComentdo(params);
	}

}
