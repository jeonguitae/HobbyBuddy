package kr.co.hb.admin.dao;

import java.util.ArrayList;

import kr.co.hb.admin.dto.SecretDTO;

public interface SecretDAO {

	int totalCount();

	ArrayList<SecretDTO> secretPageList(int cnt, int offset);

	void secret_ChkOff(String sboard_num);

	void secret_ChkOn(String sboard_num);

	void secretSet(int sboard_num);

	int sTotalCount();

	int sTotalCountSearch(String search);

	ArrayList<SecretDTO> secretSearch(String search);

}
