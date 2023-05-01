package kr.co.hb.group.dao;

import java.util.HashMap;

public interface GroupBoardDAO {

	String sorting(HashMap<String, String> params);

	String gwrite(HashMap<String, String> params);

}
