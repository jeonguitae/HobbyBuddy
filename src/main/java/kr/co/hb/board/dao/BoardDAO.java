package kr.co.hb.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list();

	int fwrite(BoardDTO dto);

	void filesave(int fbNo, MultipartFile photo);

	void uphit();

	BoardDTO detail(int fbNo);


	String findFile(int fbNo);

	int fdelete(int fbNo);

	int fupdate(HashMap<String, String> params);

	void filesave(String id, String board_class, String ori_photo_name, String new_photo_name, int board_num);

	

	

	

}
