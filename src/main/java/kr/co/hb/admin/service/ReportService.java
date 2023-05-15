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
	
	public HashMap<String, Object> report_msg_profileList(int page, int cnt) {
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
		
		ArrayList<ReportDTO> report_msg_profileList = dao.report_msg_profileList(cnt, offset);
		
		map.put("report_msg_profileList", report_msg_profileList);
		
		
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

	public HashMap<String, Object> report_fboardList(int page, int cnt) {
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
		
		ArrayList<ReportDTO> report_fboardList = dao.report_fboardList(cnt, offset);
		
		map.put("report_fboardList", report_fboardList);
		
		
		return map;
	}

	public HashMap<String, Object> report_gboardList(int page, int cnt) {
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
		
		ArrayList<ReportDTO> report_gboardList = dao.report_gboardList(cnt, offset);
		
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
