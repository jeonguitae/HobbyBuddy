package kr.co.hb.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.hb.main.dao.MainDAO;
import kr.co.hb.main.dto.MainDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MainDAO dao;


	public ArrayList<MainDTO> idFind2(HashMap<String, String> params) {
		return dao.idFind2(params);
	}


	public MainDTO pwFind2(String id, String phone) {
		logger.info("pwFind2.service 도착");
		return dao.pwFind2(id,phone);
	}


	public MainDTO pwFind3(String id, String chkresp) {
		logger.info("pwFind3.service 도착");
		return dao.pwFind3(id,chkresp);
	}


	public void pwFind4(String id) {
		HashMap<String, Object> map = new HashMap<>();
		
		String pw = "1111";
		logger.info("pw : " + pw);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(pw);
		
		logger.info("pwFind4 encodedPassword : " + encodedPassword);
		dao.pwFind4(id,encodedPassword);

	}

	
}
