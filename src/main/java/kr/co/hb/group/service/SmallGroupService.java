package kr.co.hb.group.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.group.dao.SmallGroupDAO;
import kr.co.hb.group.dto.SmallGroupDTO;

@Service
public class SmallGroupService {
	
	@Autowired SmallGroupDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int sgwrite(HashMap<String, String> params) {
		
		return dao.sgwrite(params);
	}

	public ArrayList<SmallGroupDTO> sglist(int gidx) {
		
		return dao.sglist(gidx);
	}

	public int sgjoin(int sidx, String id) {
		
		return dao.sgjoin(sidx, id);
	}

	public ArrayList<SmallGroupDTO> sgjlist(int sidx) {
		
		return dao.sgjlist(sidx);
	}

	public int memchk(String id, int sidx) {
		
		return dao.memchk(id, sidx);
	}

	public int maxmemchk(int sidx) {
		
		return dao.maxmemchk(sidx);
	}

	public int maxmem(int sidx) {
		
		return dao.maxmem(sidx);
	}
}
