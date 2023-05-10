package kr.co.hb.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.admin.dao.SecretDAO;
import kr.co.hb.admin.dto.SecretDTO;

@Service
public class SecretService {

	@Autowired SecretDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> secretPageList(int page, int cnt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * cnt;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.totalCount();
		int range = total%cnt == 0 ? total/cnt : (total/cnt) + 1;
		
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		
		ArrayList<SecretDTO> secretPageList = dao.secretPageList(cnt, offset);
		
		map.put("secretPageList", secretPageList);
		
		return map;
	}

	public String secret_ChkUpdate(String sboard_num, String secret_state) {
		 
		logger.info("서비스 등장");
		logger.info("secret_state : " + secret_state);
		
		if (secret_state.equals("true")) {
		    logger.info("참이니까 서비스에서 꺼야함 실행");
		    dao.secret_ChkOff(sboard_num);
		} else {
		    logger.info("거짓이니까 서비스에서 참 실행");
		    dao.secret_ChkOn(sboard_num);
		}

		   
		   logger.info("secret_state : " + secret_state);
		   return secret_state;
		 }
	
}
