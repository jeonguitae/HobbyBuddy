package kr.co.hb.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.board.dao.RandomDAO;
import kr.co.hb.board.dto.RandomDTO;

@Service
public class RandomService {

	@Autowired RandomDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public ArrayList<RandomDTO> profileList(HashMap<String, String> params) {
	
		logger.info("검색 조건 : " + params);
		
		return dao.profileList(params);

	}
	
	public ArrayList<RandomDTO> randomList(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		
		return dao.randomList(params);

	}
	
	public ArrayList<RandomDTO> nonameList(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		
		return dao.nonameList(params);

	}

	public HashMap<String, Object> list(int page, int cnt) {
	     
	      logger.info(page+"페이지 보여줘");
	      logger.info("한 페이지에 "+cnt+" 개씩 보여줄거야");
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      
	      // 1pege = offset:0
	      // 2pege = offset:5
	      // 3pege = offset:10
	   
	      int offset=(page-1)*cnt;
	      
	      // 만들 수 있는 총 페이지수
	      // 전체 게시물 / 페이지당 보여줄 수 
	      int total = dao.totalCount();
	      int range = total%cnt ==0? total/cnt:(total/cnt)+1;
	      logger.info("전체 게시물 수 : " + total);
	      logger.info("총 페이지 수 : " + range);
	      
	      page = page > range ? range : page;
	      
	      map.put("currPage",page);
	      map.put("pages", range);
	      
	      ArrayList<RandomDTO> list = dao.list(cnt,offset);
	      map.put("list", list);
	      
	      return map;
	   }

}
