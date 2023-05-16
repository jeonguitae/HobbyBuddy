package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.MemberManageDTO;
import kr.co.hb.board.dto.RandomDTO;

public interface MemberManageDAO {

	ArrayList<MemberManageDTO> memberList();

	ArrayList<RandomDTO> alist();

	ArrayList<RandomDTO> misearch(HashMap<String, String> params);

	ArrayList<RandomDTO> mnsearch(HashMap<String, String> params);

	MemberManageDTO mdetail(String id);

	MemberManageDTO proPhotoList(String id, String board_class);

	ArrayList<MemberManageDTO> adminList();

	ArrayList<MemberManageDTO> mList();

}
