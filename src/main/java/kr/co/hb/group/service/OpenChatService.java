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

	public int openlist(HashMap<String, String> params) {
		
		return dao.openlist(params);
	}

	public ArrayList<OpenChatDTO> openchatlist() {
		
		return dao.openchatlist();
	}

	

}
