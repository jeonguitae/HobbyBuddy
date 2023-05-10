package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.MemberManageDTO;

public interface MemberManageDAO {

	ArrayList<MemberManageDTO> memberList(HashMap<String, String> params);

	ArrayList<MemberManageDTO> misearch(HashMap<String, String> params);

	ArrayList<MemberManageDTO> mnsearch(HashMap<String, String> params);

}
