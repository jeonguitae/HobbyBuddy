package kr.co.hb.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.member.dto.MemberDTO;

public interface MemberDAO {

	int overlay(String id);

	int join(HashMap<String, String> params);

	int login(String id, String pw);

	ArrayList<MemberDTO> city();

	ArrayList<MemberDTO> area(String city);

	String adminChk(String id, String pw);

}
