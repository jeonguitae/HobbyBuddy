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
	
	public ArrayList<RandomDTO> noNameList(HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		return dao.noNameList(params);

	}
	public RandomDTO detail(String id) {
		return dao.detail(id);
	}

	public RandomDTO proPhotoList(String id) {
		String Board_class = "프로필";
		return dao.proPhotoList(id, Board_class);
	}




}
