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
		dao.msgReplyDo(params);
	}

}
