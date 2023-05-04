package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.OpenChatDTO;

public interface OpenChatDAO {

	int openlist(HashMap<String, String> params);

	ArrayList<OpenChatDTO> openchatlist();


}
