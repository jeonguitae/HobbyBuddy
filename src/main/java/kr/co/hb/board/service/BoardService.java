package kr.co.hb.board.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.board.dao.BoardDAO;
import kr.co.hb.board.dto.BoardDTO;
@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardDAO dao;
	
	public ArrayList<BoardDTO> flist() {
		return dao.flist();
	}

}
