package kr.co.hb.board.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dao.BoardDAO;
import kr.co.hb.board.dto.BoardDTO;
@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardDAO dao;
	
	public ArrayList<BoardDTO> list() {
		return dao.list();
	}

	public String fwrite(MultipartFile photo, HashMap<String, String> params) {
		
		String page = "redirect:/list.do"; 
		logger.info("서비스에서 write 시작");
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(params.get("subject"));
		dto.setId(params.get("user_name"));
		dto.setbContent(params.get("bContent"));
		
		logger.info("dto 담음");;
		
		int row = dao.write(dto);
		
		int fbNo = dto.getFbNo();
		logger.info("방금 insert한 idx : "+fbNo);
		
		/* page = "redirect:/fdetail.do?fbNo="+fbNo; */
		 page = "redirect:/flist.go";
		if(!photo.getOriginalFilename().equals("")) {
			ffilesave(fbNo,photo);
		}
		return page;
	}

	private void ffilesave(int fbNo, MultipartFile file) {
		//파일 저장해야하니까
		String orifilename = file.getOriginalFilename();
		String ext = orifilename.substring(orifilename.lastIndexOf("."));
		String newfilename = System.currentTimeMillis()+ext;
		logger.info(newfilename);
		
		try {
			//바이트 추출하고 경로
			byte[] bytes = file.getBytes();
			Path path = Paths.get("C:/img/upload/"+newfilename);
			
			Files.write(path, bytes);
			
			dao.filewrite(fbNo,orifilename,newfilename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
