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
	
	public ArrayList<GroupBoardDTO> list() {
		
		return dao.list();
	}
	
	public String sorting(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		
		return dao.sorting(params);
	}
	public int gwrite(HashMap<String, String> params) {
		
		logger.info("생성 데이터 : " + params);
		
		return dao.gwrite(params);
	}

	
	public GroupBoardDTO gdetail(int id) {
		
		return dao.gdetail(id);
	}

	public GroupBoardDTO gupdate(int id) {
		
		return dao.gupdate(id);
	}

	public int gupdate(HashMap<String, String> params) {

		return dao.gupdate(params);
		
	}

}
