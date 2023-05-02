package kr.co.hb.group.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.board.dto.RandomDTO;
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

	public GroupBoardDTO gupdate(int id) {
		
		return dao.gupdate(id);
	}

	public GroupBoardDTO gupdatedo(HashMap<String, String> params) {

		return dao.gupdatedo(params);
		
	}

	public ArrayList<GroupBoardDTO> gserch(HashMap<String, String> params) {
		logger.info("gserch 서비스 호출");
		ArrayList<GroupBoardDTO> fewqtr = dao.gserch(params);
		for (int i = 0; i < fewqtr.size(); i++) {
			logger.info(fewqtr.get(i).getId());
		}
		return dao.gserch(params);
	}

}
