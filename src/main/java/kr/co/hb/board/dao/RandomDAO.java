package kr.co.hb.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.board.dto.RandomDTO;

public interface RandomDAO {

	ArrayList<RandomDTO> profileList(HashMap<String, String> params);
	
	ArrayList<RandomDTO> randomList(HashMap<String, String> params);
	
	
	
}
