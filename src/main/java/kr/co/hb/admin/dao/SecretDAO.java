package kr.co.hb.admin.dao;

import java.util.ArrayList;

import kr.co.hb.admin.dto.SecretDTO;

public interface SecretDAO {

	int totalCount();

	ArrayList<SecretDTO> secretPageList(int cnt, int offset);

}
