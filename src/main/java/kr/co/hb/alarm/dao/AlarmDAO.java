package kr.co.hb.alarm.dao;

import java.util.ArrayList;

import kr.co.hb.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	ArrayList<AlarmDTO> alarmList(String id_receive);

	int alarmCount(String id_receive);

	ArrayList<AlarmDTO> beforeAlarm(String id);

	int alarmListRead(String id);

	AlarmDTO alarmListRead_select(String id);

	void alarmListRead_insert(AlarmDTO dto);



}
