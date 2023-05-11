package kr.co.hb.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.message.dao.MessageDAO;
import kr.co.hb.message.dto.MessageDTO;

@Service
public class MessageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MessageDAO dao;
	
	public ArrayList<MessageDTO> msgList(String id) {
		return dao.msgList(id);
	}

	public void msgReplyDo(HashMap<String, String> params) {
		
		MessageDTO dto = new MessageDTO();
		dto.setId_receive(params.get("id_receive"));
		dto.setId_send(params.get("id_send"));
		dto.setMsg_content(params.get("msg_content"));
		
		int row = dao.msgReplyDo(dto);
		
		
		String id_send = dto.getId_send();
		String id_receive = dto.getId_receive();		
		String alarm_title = "쪽지 왔어요~";
		String alarm_content = dto.getMsg_content();		
		String alarm_class = "쪽지";		
		int alarm_num = dto.getMsgNo();
		
		dao.msgAlarm(id_send,id_receive,alarm_title,alarm_content,alarm_class,alarm_num);
		
	}

	public void msgChatDo(HashMap<String, String> params) {
		
		MessageDTO dto = new MessageDTO();
		dto.setId_receive(params.get("id_receive"));
		dto.setId_send(params.get("id_send"));
		dto.setMsg_content(params.get("msg_content"));
		
		int row = dao.msgChatDo(dto);		
		
		String id_send = dto.getId_send();
		String id_receive = dto.getId_receive();		
		String alarm_title = "쪽지 왔어요~";
		String alarm_content = dto.getMsg_content();		
		String alarm_class = "쪽지";		
		int alarm_num = dto.getMsgNo();
		
		dao.msgAlarm(id_send,id_receive,alarm_title,alarm_content,alarm_class,alarm_num);
		
	}

	public void msgDel(String msgNo) {
		dao.msgDel(msgNo);
		
	}

	public ArrayList<MessageDTO> msgList2(String id) {
		return dao.msgList2(id);
	}

	public int reportMsgDo(HashMap<String, String> params) {
		return dao.reportMsgDo(params);
	}


}
