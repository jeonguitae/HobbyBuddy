package kr.co.hb.board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dao.BoardDAO;
import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.group.dto.GroupBoardDTO;
@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardDAO dao;
	
	public ArrayList<BoardDTO> list() {
		return dao.list();
	}

	public String fwrite(MultipartFile photo, HashMap<String, String> params,HttpSession session) {
		
		logger.info("서비스까지 왔땅");
		//insert하면서 auto되는 애 key 뽑아올 때 dto로 함
		//name이 title인 애의 value를 갖고 와라 
		BoardDTO dto = new BoardDTO();
		dto.setTitle(params.get("title"));
		dto.setId(params.get("id"));
		dto.setbContent(params.get("bContent"));
		dto.setBoard_class("자유");
		dto.setBig_hb(params.get("bhobby"));
		dto.setSmall_hb(params.get("mhobby"));
		
		String board_class = dto.getBoard_class();
		logger.info("board_class : " + board_class);
		
		String id = dto.getId();
		logger.info("dao.fwrite(dto) 시작");
		int row = dao.fwrite(dto);
		logger.info("서비스까지 왔땅 dto row : " + row);
		
		int board_num = dto.getFbNo();
		logger.info("board_num : " + board_num);
		
		String page = "redirect:/fdetail.do?fbNo="+board_num;
		
		//만약 사진 있으면?
		if(!photo.getOriginalFilename().equals("")) {
			filesave(id,board_class,photo,board_num);
		}
		return page;
	}

	private void filesave(String id, String board_class, MultipartFile photo, int fbNo) {
		logger.info("filesave 왔땅 dto");
		//이름명
		String ori_photo_name=photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis()+ext;
		try {
			logger.info("filesave 왔땅 try 한당");
			//바이트 추출
			byte[] bytes = photo.getBytes();
			//경로와 이름 붙여서 지정
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			//파일로 저장(경로), 바이트
			Files.write(path, bytes);
			
			//db에 저장-dao
			logger.info("filesave dao 한당");
			dao.filesave(id,board_class,ori_photo_name,new_photo_name,fbNo);
			logger.info("filesave dao 끝난당");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//경로 저장
		
	}

	public BoardDTO detail(int fbNo, String flag) {
		if (flag.equals("detail")) {
			dao.uphit(fbNo);
		}
		return dao.detail(fbNo);
	}

	public void fdelete(int fbNo) {
		//파일 있다면
		String new_photo_name = dao.findFile(fbNo);
		logger.info(new_photo_name+"은 왔나?");
		//없으면 삭제
		int row = dao.fdelete(fbNo);
		//파일도 삭제
		if (new_photo_name!=null) {
			//글 삭제됐나?
			if (row>0) {
				//객체화 위치 지정
				File file = new File("C:/img/upload"+new_photo_name);
				if (file.exists()) {
					file.delete();
				}
			}
		}
	}
	
	public String fupdate(MultipartFile photo, HashMap<String, String> params) {
		int fbNo = Integer.parseInt(params.get("fbNo"));
		int row = dao.fupdate(params);
		logger.info("fbNo : " + fbNo);
		
		BoardDTO dto = new BoardDTO();
		dto.setId(params.get("id"));
		dto.setBoard_class("자유");
		String board_class = "자유";
		String id = dto.getId();
		int board_num = dto.getFbNo();
		logger.info("board_num : " + board_num);
		
		logger.info("update service서 처리 중"+row);
		
	
		
		//사진도 수정해야 하니까 
		if (photo != null && !photo.getOriginalFilename().equals("")) {
            filesave(id,board_class, photo, fbNo);
        } 
		return "redirect:/fdetail.do?fbNo="+fbNo;
	}

	public void fphotodel(int fbNo, String board_class) {

		
		board_class = "자유";
		//idx가 있는 경우-사진
		String new_photo_name = dao.findFile(fbNo);
		//사진 없는 경우
		int row = dao.fphotodel(fbNo, board_class);
		logger.info("사진 삭제할거양"+row);
		
		if (new_photo_name != null && row>0 ) {
			File file = new File("C:/img/upload"+new_photo_name);
			if (file.exists()) {
				file.delete();
			}
		}
	}

	public ArrayList<BoardDTO> coList(int fbNo) {
		return dao.coList(fbNo);
	}

	public int cowrite(HashMap<String, String> params) {
		return dao.cowrite(params);
	}

	public int codelete(int coNo) {
		return dao.codelete(coNo);
	}


	public ArrayList<BoardDTO> fsorting(HashMap<String, String> params) {
		return dao.fsorting(params);
	}

	public ArrayList<BoardDTO> fsearch(HashMap<String, String> params) {
		
		ArrayList<BoardDTO> list = null;
		
		if(params.get("fsearch").equals("title")) {
			String wildcard = "%" + params.get("fsearch") + "%";
			params.replace("fsearch", wildcard);
			list = dao.tsearch(params);
		}
		
		if(params.get("fsearch").equals("id")) {
			
			String wildcard = "%" + params.get("fsearch") + "%";
			params.replace("fsearch", wildcard);
			list = dao.isearch(params);
		}
		
		if(params.get("fsearch").equals("bContent")) {
			
			String wildcard = "%" + params.get("fsearch") + "%";
			params.replace("fsearch", wildcard);
			list = dao.csearch(params);
		}
		
		return list;
	}

	public int bmarkdo(String memid, String myid) {
		return dao.bmarkdo(memid, myid);
	}
	
	
	
	}



	 


	

	
		
		
		
		
		
		
		
		


