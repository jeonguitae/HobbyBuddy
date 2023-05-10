package kr.co.hb.message.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.message.dto.MessageDTO;

public interface MessageDAO {

	ArrayList<MessageDTO> msgList(String id);

	void msgReplyDo(HashMap<String, String> params);

}
