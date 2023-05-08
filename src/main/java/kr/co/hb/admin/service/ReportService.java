package kr.co.hb.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.admin.dao.ReportDAO;
import kr.co.hb.admin.dto.ReportDTO;

@Service
public class ReportService {

	@Autowired ReportDAO dao;
	
	public HashMap<String, Object> reportPageList(int page, int cnt) {
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
		
		ArrayList<ReportDTO> reportPageList = dao.reportPageList(cnt, offset);
		
		map.put("reportPageList", reportPageList);
		
		return map;
	}

}
