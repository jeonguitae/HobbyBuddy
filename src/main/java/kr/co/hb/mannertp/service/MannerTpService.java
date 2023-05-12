package kr.co.hb.mannertp.service;


import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.mannertp.dao.MannerTpDAO;
import kr.co.hb.mannertp.dto.MannerTpDTO;

import org.springframework.stereotype.Service;

@Service
public class MannerTpService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MannerTpDAO dao;

	public MannerTpDTO mannerChk(String id_receive, String id_send, String tp_cal) {		
		return dao.mannerChk(id_receive,id_send,tp_cal);		
	}

	public void mannertpDel(String id_r, String id_s) {
		dao.mannertpDel(id_r,id_s);
		
	}

	public void mannertpM(String id_r) {
		dao.mannertpM(id_r);
		
	}

	public void mannertpP(String id_r) {
		dao.mannertpP(id_r);
		
	}

	public void mannertpUp(String id_receive) {
		dao.mannertpUp(id_receive);
		
	}

	public void mannertpUp2(String id_receive, String id_send, String string) {
		dao.mannertpUp2(id_receive,id_send,string);
		
	}

	public void mannertpDown(String id_receive) {
		dao.mannertpDown(id_receive);
		
	}

	public void mannertpDown2(String id_receive, String id_send, String string) {
		dao.mannertpDown2(id_receive,id_send,string);
		
	}



}
