package kr.co.hb.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.board.dao.RandomDAO;
import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.group.dto.GroupBoardDTO;

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
	
	public ArrayList<RandomDTO> noNameList(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		return dao.noNameList(params);

	}
	public RandomDTO detail(String id) {
		return dao.detail(id);
	}

	public RandomDTO proPhotoList(String id) {
		String Board_class = "프로필";
		
		logger.info("검색 조건 : " + id + " / " + Board_class);
		return dao.proPhotoList(id, Board_class);
	}

	public ArrayList<RandomDTO> plist() {
		return dao.plist();
	}

	public ArrayList<RandomDTO> psearch(HashMap<String, String> params) {
		ArrayList<RandomDTO> list = null;
		
		if(params.get("ssorting").equals("id")) {
			
			String wildcard = "%" + params.get("search") + "%";
			params.replace("search", wildcard);
			list = dao.pisearch(params);
		}
		
		if(params.get("ssorting").equals("name")) {
			
			String wildcard = "%" + params.get("search") + "%";
			params.replace("search", wildcard);
			list = dao.pnsearch(params);
		}
		
		return list;
	}

	public int reList(HashMap<String, String> params) {
		return dao.reList(params);
	}

	public int banupdate(String id) {
		logger.info("아이디 : " + id );
		return dao.banupdate(id);
	}

	public int adminupdate(String id) {
		logger.info("아이디 : " + id );
		return dao.adminupdate(id);
	}

	public int bupdate(String id) {
		logger.info("아이디 : " + id );
		return dao.bupdate(id);
	}

	public int aupdate(String id) {
		logger.info("아이디 : " + id );
		return dao.aupdate(id);
	}




}
