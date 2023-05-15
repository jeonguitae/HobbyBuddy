package kr.co.hb.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<AlarmDTO> beforeAlarm(String id) {
		return dao.beforeAlarm(id);
	}

	public HashMap<String, Object> alarmListRead(ArrayList<String> alarmListRead) {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();	
		int delSize = alarmListRead.size();
		int successCnt = 0;
		for (String id : alarmListRead) {
			AlarmDTO dto = dao.alarmListRead_select(id);
			logger.info("alarmListRead_select dto : " + dto);
			dao.alarmListRead_insert(dto);
			successCnt += dao.alarmListRead(id);
		}		
		map.put("msg", delSize+" 개의 알림 중 "+successCnt+" 개의 알림을 이전 알림 리스트로 이동 시켰습니다.");		
		map.put("success", true);
		return map;
	}


}
