package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.GroupBoardDTO;

public interface GroupBoardDAO {

	ArrayList<GroupBoardDTO> list();
	
	String sorting(HashMap<String, String> params);

	int gwrite(HashMap<String, String> params);

	GroupBoardDTO gdetail(int id);

	GroupBoardDTO gupdate(int id);

	int gupdate(HashMap<String, String> params);


}
