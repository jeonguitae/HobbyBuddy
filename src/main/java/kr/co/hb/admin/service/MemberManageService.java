package kr.co.hb.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.admin.dto.MemberManageDTO;
import kr.co.hb.board.dao.RandomDAO;
import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.admin.dao.MemberManageDAO;

@Service
public class MemberManageService {

	@Autowired MemberManageDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public ArrayList<MemberManageDTO> memberList(HashMap<String, String> params) {
	
		logger.info("검색 조건 : " + params);
		
		return dao.memberList(params);

	}



	
}
