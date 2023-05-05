
package kr.co.hb.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.main.dto.MainDTO;

public interface MainDAO {

	HashMap<String, Object> idFind2(String email, String phone);

	ArrayList<MainDTO> idFind2(HashMap<String, String> params);

	MainDTO pwFind2(String id, String phone);

	MainDTO pwFind3(String id, String chkresp);

	void pwFind4(String id, String encodedPassword);


}
