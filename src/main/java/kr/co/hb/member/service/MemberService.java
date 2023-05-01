package kr.co.hb.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.member.dao.MemberDAO;
import kr.co.hb.member.dto.MemberDTO;


@Service
public class MemberService {
	
	@Autowired MemberDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> overlay(String id) {
		HashMap<String, Object> map = new HashMap<>();
		// 같은 아이디가 있는가? 있으면 1 없으면 0
		map.put("overlay", dao.overlay(id));		
		return map;
	}

	public HashMap<String, Object> join(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", dao.join(params));
		logger.info("service.join map : " + map);
		return map;
	}

	public int login(String id, String pw, HttpSession session) {
		String adminChk = dao.adminChk(id,pw);
		session.setAttribute("adminChk", adminChk);
		logger.info("adminChk : " + adminChk);
		return dao.login(id,pw);
	}

	public ArrayList<MemberDTO> city() {
		return dao.city();
	}

	public ArrayList<MemberDTO> area(String city) {
		logger.info("Service city : " + city);
		return dao.area(city);
	}

	
}
