package kr.co.hb.group.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.group.dao.OpenChatDAO;
import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.group.dto.OpenChatDTO;

@Service
public class OpenChatService {
	
	@Autowired OpenChatDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public int openlist(String loginId, int gidx) {
		
		return dao.openlist(loginId, gidx);
	}

	public int memchk(String loginId, int gidx) {
		
		return dao.memchk(loginId, gidx);
	}

	public ArrayList<OpenChatDTO> openchatlist(int gidx) {
		
		return dao.openchatlist(gidx);
	}

	public int sendmsg(HashMap<String, String> params, int gidx) {
		
		return dao.sendmsg(params, gidx);
	}

	public ArrayList<OpenChatDTO> listmsg() {
	
		return dao.listmsg();
	}

	public ArrayList<GroupBoardDTO> clist(int gidx) {
		
		return dao.clist(gidx);
	}
	

}
