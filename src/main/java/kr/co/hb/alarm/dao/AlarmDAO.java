package kr.co.hb.alarm.dao;

import java.util.ArrayList;

import kr.co.hb.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	ArrayList<AlarmDTO> alarmList(String id_receive);



}
