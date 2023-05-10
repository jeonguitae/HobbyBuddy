package kr.co.hb.group.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.group.dao.GroupBoardDAO;
import kr.co.hb.group.dto.GroupBoardDTO;

@Service
public class GroupBoardService {
	
	@Autowired GroupBoardDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ArrayList<GroupBoardDTO> glist() {
		
		return dao.glist();
	}
	
	public ArrayList<GroupBoardDTO> gsorting(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		
		return dao.gsorting(params);
	}
	public int gwrite(HashMap<String, String> params) {
		
		logger.info("생성 데이터 : " + params);
		
		return dao.gwrite(params);
	}

	
	public GroupBoardDTO gdetail(int id) {
		
		return dao.gdetail(id);
	}

	public ArrayList<GroupBoardDTO> gserch(HashMap<String, String> params) {
		
		ArrayList<GroupBoardDTO> list = null;
		
		if(params.get("ssorting").equals("subject")) {
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gsserch(params);
		}
		
		if(params.get("ssorting").equals("id")) {
			
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gwserch(params);
		}
		
		if(params.get("ssorting").equals("content")) {
			
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gcserch(params);
		}
		
		return list;
	}

	/*
	 * public HashMap<String, Object> gboardpagelist(int page, int cnt) {
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * // 1page = offset : 0 // 2page = offset : offset + 5 // 3page = offset : 10
	 * 
	 * int offset = (page - 1) * cnt;
	 * 
	 * // 만들 수 있는 총 페이지 수 // 전체 게시물 / 페이지 당 보여줄 수 int total = dao.totalCount(); int
	 * range = total%cnt == 0 ? total/cnt : (total/cnt) + 1;
	 * 
	 * 
	 * page = page > range ? range : page;
	 * 
	 * map.put("currPage", page); map.put("pages", range);
	 * 
	 * ArrayList<GroupBoardDTO> gboardpagelist = dao.gboardpagelist(cnt, offset);
	 * 
	 * map.put("gboardpagelist", gboardpagelist);
	 * 
	 * return map; }
	 */

}
