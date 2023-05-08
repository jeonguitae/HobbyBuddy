package kr.co.hb.alarm.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.alarm.dao.AlarmDAO;
import kr.co.hb.alarm.dto.AlarmDTO;

@Service
public class AlarmService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDAO dao;
	
	public ArrayList<AlarmDTO> alarmList(String id_receive) {
		logger.info("service alarmList");
		return dao.alarmList(id_receive);
	}

	public int alarmCount(String id_receive) {
		return dao.alarmCount(id_receive);
	}

}
