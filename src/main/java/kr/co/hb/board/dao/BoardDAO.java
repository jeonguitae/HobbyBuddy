package kr.co.hb.board.dao;

import java.util.ArrayList;

import kr.co.hb.board.dto.BoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> flist();

	int write(BoardDTO dto);

	void filewrite(int fbNo, String orifilename, String newfilename);

}
