package kr.co.hb.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.board.dto.RandomDTO;
import kr.co.hb.group.dto.GroupBoardDTO;

public interface RandomDAO {

	ArrayList<RandomDTO> profileList(HashMap<String, String> params);
	
	ArrayList<RandomDTO> randomList(HashMap<String, String> params);

	ArrayList<RandomDTO> noNameList(HashMap<String, String> params);

	RandomDTO detail(String id);

	RandomDTO proPhotoList(String id, String board_class);

	ArrayList<RandomDTO> plist();

	ArrayList<RandomDTO> pisearch(HashMap<String, String> params);

	ArrayList<RandomDTO> pnsearch(HashMap<String, String> params);






	
	
	
}
