package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.OpenChatDTO;

public interface OpenChatDAO {

	int openlist(String loginId, int gidx);

	ArrayList<OpenChatDTO> openchatlist(int gidx);

	int memchk(String loginId, int gidx);

	int sendmsg(HashMap<String, Object> params);


}
