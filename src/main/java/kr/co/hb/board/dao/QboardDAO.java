package kr.co.hb.board.dao;

import kr.co.hb.board.dto.QboardDTO;

public interface QboardDAO {

	int qboard_write(QboardDTO dto);

	void qboardFileSave(int board_num, String board_class, String ori_photo_name, String new_photo_name);

}
