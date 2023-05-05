package kr.co.hb.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.member.dto.MemberDTO;

public interface MemberDAO {

	int overlay(String id);

	int join(HashMap<String, String> params);

	//int login(String id, String pw);

	ArrayList<MemberDTO> city();

	ArrayList<MemberDTO> area(String city);

	String adminChk(String id, String pw);

	int pwChk2(String id, String pw);
	
	HashMap<String, Object> myProDetail(Object id);

	int memberUpdate(HashMap<String, String> params);

	void dropOut(String id);
	
	ArrayList<MemberDTO> big_hb();

	ArrayList<MemberDTO> small_hb(String big_hb);

	int hbPlus(HashMap<String, String> params);

	ArrayList<MemberDTO> myHobbyList(String id);

	int myHobbyDelList(String id);

	void proPhotoSave(String id, String file_class, String oriFileName, String newFileName);

	MemberDTO myProPhotoList(String id, String file_class);

	int myProPhotoDel(String id, String file_class);

	String findFile(String id, String file_class);

	MemberDTO findLoginPw(String id);

	MemberDTO login(String id);

	MemberDTO myProPwUpdate(Object attribute);

	int changePw(String id, String changePw2);

	ArrayList<MemberDTO> myBoardList(String id);

	

	



}
