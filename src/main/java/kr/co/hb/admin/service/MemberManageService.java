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

	public ArrayList<RandomDTO> alist() {
		return dao.alist();
	}
	
	public ArrayList<MemberManageDTO> memberList() {
		
		return dao.memberList();
	}

	public ArrayList<RandomDTO> msearch(HashMap<String, String> params) {
		
		ArrayList<RandomDTO> list = null;
		
		if(params.get("ssorting").equals("id")) {
			
			String wildcard = "%" + params.get("search") + "%";
			params.replace("search", wildcard);
			list = dao.misearch(params);
		}
		
		if(params.get("ssorting").equals("name")) {
			
			String wildcard = "%" + params.get("search") + "%";
			params.replace("search", wildcard);
			list = dao.mnsearch(params);
		}
		
		return list;
	}

	public MemberManageDTO mdetail(String id) {
		return dao.mdetail(id);
	}

	public MemberManageDTO proPhotoList(String id) {
		String Board_class = "프로필";
		
		logger.info("검색 조건 : " + id + " / " + Board_class);
		return dao.proPhotoList(id, Board_class);
	}

	public ArrayList<MemberManageDTO> adminList() {
		
		return dao.adminList();
	}

	public ArrayList<MemberManageDTO> mList() {
		return dao.mList();
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
