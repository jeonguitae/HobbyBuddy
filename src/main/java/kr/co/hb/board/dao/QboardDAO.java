package kr.co.hb.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.board.dto.QboardDTO;

public interface QboardDAO {

	int qboard_write(QboardDTO dto);

	void qboardFileSave(String id, int board_num, String qboard_class, String ori_photo_name, String new_photo_name);

	int totalCount();

	ArrayList<QboardDTO> qboardPageList(int cnt, int offset);

	QboardDTO qboardDetail(String qboard_no);

	int qboardUpdate(HashMap<String, String> params);

	String qboardFindFile(String qboard_no);

	int qboardDelete(String qboard_no);	

	void deletePhoto(String photoIdx, String qboard_no);

	String noticeFindFile2(String photoIdx);

}
