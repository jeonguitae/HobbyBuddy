package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.GroupBoardDTO;

public interface GroupBoardDAO {

	ArrayList<GroupBoardDTO> glist();
	
	ArrayList<GroupBoardDTO> gsorting(HashMap<String, String> params);

	int gwrite(GroupBoardDTO dto);

	GroupBoardDTO gdetail(int gidx);

	ArrayList<GroupBoardDTO> gwserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gsserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gcserch(HashMap<String, String> params);

	ArrayList<GroupBoardDTO> gboardpagelist(int cnt, int offset);

	int totalCount();

	void uphit(int gidx);

	int gupdate(HashMap<String, String> params);

	void filesave(String id, String board_class, String ori_photo_name, String new_photo_name, int gidx);

	void gdelete(int gidx);

	int hostchk(String loginId);

	int host(String loginId, int gidx);


}
