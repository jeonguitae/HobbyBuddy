package kr.co.hb.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.group.dto.GroupBoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list();

	int fwrite(BoardDTO dto);

	void filesave(int fbNo, MultipartFile photo);

	void uphit(int fbNo);

	BoardDTO detail(int fbNo);


	String findFile(int fbNo);

	int fdelete(int fbNo);

	int fupdate(HashMap<String, String> params);

	void filesave(String id, String board_class, String ori_photo_name, String new_photo_name, int fbNo);

	int fphotodel(int fbNo, String board_class);

	ArrayList<BoardDTO> coList(int fbNo);

	int cowrite(HashMap<String, String> params);

	int codelete(int coNo);

	ArrayList<BoardDTO> fsorting(HashMap<String, String> params);
	
	ArrayList<BoardDTO> tsearch(HashMap<String, String> params);

	ArrayList<BoardDTO> isearch(HashMap<String, String> params);

	ArrayList<BoardDTO> csearch(HashMap<String, String> params);

	int bmarkdo(String memid, String myid);

	void coAlarm(String id_send, String id_receive, String alarm_title, String alarm_content, String alarm_class,
			String alarm_num);

	int bmarkch(String memid, String myid);

	ArrayList<BoardDTO> bmarklist(String id);

	ArrayList<BoardDTO> bmarkselect(String id);

	int bcancel(String myid, String memid);

	int freportdo(HashMap<String, String> params);

	BoardDTO detail1(int fbNo);

	void fboardSecretSet(String writer_id, String admin_id, String sboard_class, String sboard_title,
			String sboard_num);

	int adminchk(String loginId);


	

	
	



	

	

	

}
