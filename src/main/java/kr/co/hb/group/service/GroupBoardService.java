package kr.co.hb.group.service;

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
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.group.dao.GroupBoardDAO;
import kr.co.hb.group.dto.GroupBoardDTO;

@Service
public class GroupBoardService {
	
	@Autowired GroupBoardDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ArrayList<GroupBoardDTO> glist() {
		
		return dao.glist();
	}
	
	/*
	 * public ArrayList<GroupBoardDTO> gsorting(HashMap<String, String> params) {
	 * 
	 * logger.info("검색 조건 : " + params);
	 * 
	 * return dao.gsorting(params); }
	 */
	public int gwrite(GroupBoardDTO dto) {
		
		logger.info("생성 데이터 : " + dto);
		
		return dao.gwrite(dto);
	}

	
	public GroupBoardDTO gdetail(int gidx, String flag) {
		if (flag.equals("detail")) {
			dao.uphit(gidx);
		}
		
		return dao.gdetail(gidx);
	}

	public ArrayList<GroupBoardDTO> gserch(HashMap<String, String> params) {
		
		ArrayList<GroupBoardDTO> list = null;
		
		if(params.get("ssorting").equals("subject")) {
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gsserch(params);
		}
		
		if(params.get("ssorting").equals("id")) {
			
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gwserch(params);
		}
		
		if(params.get("ssorting").equals("content")) {
			
			String wildcard = "%" + params.get("serch") + "%";
			params.replace("serch", wildcard);
			list = dao.gcserch(params);
		}
		
		return list;
	}

	public String gupdate(MultipartFile photo, HashMap<String, String> params) {
		
		int gidx = Integer.parseInt(params.get("gidx"));
		int row = dao.gupdate(params);
		
		GroupBoardDTO dto = new GroupBoardDTO();
		dto.setId(params.get("id"));
		dto.setBoard_class("모임");
		String board_class = "모임";
		String id = dto.getId();
		int board_num = dto.getGidx();
		logger.info("board_num : " + board_num);
		
		//사진도 수정해야 하니까 
		if (photo != null && !photo.getOriginalFilename().equals("")) {
            filesave(id, board_class, photo, gidx);
        } 
		
		return "redirect:/gdetail.do?gidx="+gidx;
	}
	
	private void filesave(String id, String board_class, MultipartFile photo, int gidx) {
		logger.info("filesave 왔땅 dto");
		//이름명
		String ori_photo_name=photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis()+ext;
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			Files.write(path, bytes);

			logger.info("filesave dao 한당");
			dao.filesave(id, board_class, ori_photo_name, new_photo_name, gidx);
			logger.info("filesave dao 끝난당");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//경로 저장
		
	}

	public void gpdelete(int gidx) {
		
		dao.gpdelete(gidx);
	}

	public int hostchk(String loginId) {
		
		return dao.hostchk(loginId);
	}

	public int host(String loginId, int gidx) {
		
		return dao.host(loginId, gidx);
	}

	public ArrayList<GroupBoardDTO> myGroupList(String loginId) {
	
		return dao.myGroupList(loginId);
	}

	public void gdelete(int gidx) {
		
		dao.gdelete(gidx);
		
	}

	public void delopenlist(int gidx) {
		
		dao.delopenlist(gidx);
	}

	public void delchat(int gidx) {

		dao.delchat(gidx);
	}

	public void delsgroup(int gidx) {

		dao.delsgroup(gidx);
	}

	public void delsgmem(int gidx) {
		
		dao.delsgmem(gidx);
	}

	public ArrayList<GroupBoardDTO> sportglist() {
		
		return dao.sportglist();
	}

	public ArrayList<GroupBoardDTO> petglist() {
		
		return dao.petglist();
	}

	public ArrayList<GroupBoardDTO> foodglist() {
		
		return dao.foodglist();
	}

	public ArrayList<GroupBoardDTO> leisureglist() {
		
		return dao.leisureglist();
	}

	public ArrayList<GroupBoardDTO> etcglist() {
		
		return dao.etcglist();
	}

	public int reportGroupDo(HashMap<String, String> params) {
		
		return dao.reportGroupDo(params);
	}

	public ArrayList<GroupBoardDTO> gsorting(String bigHb, String smallHb, String gender, String city, String area,
			String meetingDate) {

		return dao.gsorting(bigHb, smallHb, gender, city, area, meetingDate);
	}
}
