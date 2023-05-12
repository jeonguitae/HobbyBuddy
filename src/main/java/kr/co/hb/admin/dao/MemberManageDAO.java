package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.MemberManageDTO;
import kr.co.hb.board.dto.RandomDTO;

public interface MemberManageDAO {

	ArrayList<MemberManageDTO> memberList(HashMap<String, String> params);

	ArrayList<RandomDTO> alist();

}
