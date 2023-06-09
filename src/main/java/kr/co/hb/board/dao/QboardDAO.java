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

	String qboardFindFile(String board_num);

	int qboardDelete(String board_num);	

	void qDeletePhoto(String photoIdx, String board_num);

	String qboardFindFile2(String photoIdx);

	int qBoard_replyWrite(HashMap<String, String> params);

	void qboardSecretSet(String writer_id, String admin_id, String sboard_class, String sboard_title,
			String sboard_num);

	void secretUpdate(String sboard_class, String sboard_num);

	QboardDTO qboardDetail2(String qboard_no);

	int qtotalCountSearch(String search);

	ArrayList<QboardDTO> qboardSearch(String search);

	
}
