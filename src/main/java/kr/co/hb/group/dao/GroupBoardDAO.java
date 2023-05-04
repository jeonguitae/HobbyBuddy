package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.GroupBoardDTO;

public interface GroupBoardDAO {

	ArrayList<GroupBoardDTO> glist();
	
	ArrayList<GroupBoardDTO> gsorting(HashMap<String, String> params);

	int gwrite(HashMap<String, String> params);

	GroupBoardDTO gdetail(int id);

	ArrayList<GroupBoardDTO> gwserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gsserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gcserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gboardpagelist(int cnt, int offset);

	int totalCount();


}
