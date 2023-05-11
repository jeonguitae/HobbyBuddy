package kr.co.hb.message.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.message.dto.MessageDTO;

public interface MessageDAO {

	ArrayList<MessageDTO> msgList(String id);

	int msgReplyDo(MessageDTO dto);

	int msgChatDo(MessageDTO dto);

	void msgDel(String msgNo);

	ArrayList<MessageDTO> msgList2(String id);

	void msgAlarm(String id_send, String id_receive, String alarm_title, String alarm_content, String alarm_class,
			int alarm_num);

	int reportMsgDo(HashMap<String, String> params);

}
