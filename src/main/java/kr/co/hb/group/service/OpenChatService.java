package kr.co.hb.group.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.group.dao.OpenChatDAO;
import kr.co.hb.group.dto.OpenChatDTO;

@Service
public class OpenChatService {
	
	@Autowired OpenChatDAO dao;

	public int openlist(String loginId, int gidx) {
		
		return dao.openlist(loginId, gidx);
	}

	public int memchk(String loginId, int gidx) {
		
		return dao.memchk(loginId, gidx);
	}

	public ArrayList<OpenChatDTO> openchatlist(int gidx) {
		
		return dao.openchatlist(gidx);
	}

	public int sendmsg(HashMap<String, Object> params) {
		
		return dao.sendmsg(params);
	}

	

}
