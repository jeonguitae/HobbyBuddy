package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.OpenChatDTO;
import kr.co.hb.member.dto.MemberDTO;

public interface OpenChatDAO {

	int openlist(String loginId, int gidx);

	ArrayList<OpenChatDTO> openchatlist(int gidx);

	int memchk(String loginId, int gidx);

	int sendmsg(int gidx, String id, String msg);

	ArrayList<OpenChatDTO> clist(int gidx);

	HashMap<String, Integer> memconchk(String loginId);

	HashMap<String, Integer> openconchk(int gidx);

}
