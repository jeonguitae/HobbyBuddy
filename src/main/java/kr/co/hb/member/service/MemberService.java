package kr.co.hb.member.service;

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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.member.dao.MemberDAO;
import kr.co.hb.member.dto.MemberDTO;


@Service
public class MemberService {
	
	@Autowired MemberDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> overlay(String id) {
		HashMap<String, Object> map = new HashMap<>();
		// 같은 아이디가 있는가? 있으면 1 없으면 0
		map.put("overlay", dao.overlay(id));		
		return map;
	}

	public HashMap<String, Object> join(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		
		String pw = params.get("pw");
		logger.info("pw : " + pw);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(pw);
		
		params.replace("pw", pw, encodedPassword);
		
		map.put("success", dao.join(params));
		logger.info("service.join map : " + map);
		return map;
	}
/*
	public int login(String id, String pw, HttpSession session) {
		String adminChk = dao.adminChk(id,pw);
		session.setAttribute("adminChk", adminChk);
		logger.info("adminChk : " + adminChk);
		return dao.login(id,pw);
	}

	public ArrayList<MemberDTO> city() {
		return dao.city();
	}

	public ArrayList<MemberDTO> area(String city) {
		logger.info("Service city : " + city);
		return dao.area(city);
	}
*/	
	public int pwChk2(String id, String pw) {
		return dao.pwChk2(id,pw);
	}

	public HashMap<String, Object> myProDetail(Object id) {
		logger.info("Service myProDetail : " + id);
		return dao.myProDetail(id);
	}

	public HashMap<String, Object> memberUpdate(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", dao.memberUpdate(params));
		logger.info("service.memberUpdate map : " + map);
		return map;
	}

	public void dropOut(String id) {
		dao.dropOut(id);	
	}

	public ArrayList<MemberDTO> small_hb(String big_hb) {
		return dao.small_hb(big_hb);
	}

	public ArrayList<MemberDTO> big_hb() {
		return dao.big_hb();
	}

	public HashMap<String, Object> hbPlus(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", dao.hbPlus(params));
		logger.info("service.hbPlus map : " + map);
		return map;
	}

	public ArrayList<MemberDTO> myHobbyList(String id) {
		return dao.myHobbyList(id);
	}

	public HashMap<String, Object> myHobbyDel(ArrayList<String> myHobbyDelList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = myHobbyDelList.size();
		int successCnt = 0;
		for (String id : myHobbyDelList) {
			successCnt += dao.myHobbyDelList(id);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
	}

	public String proPhotoUpload(MultipartFile photo, HashMap<String, String> params) {

		MemberDTO dto = new MemberDTO();
		dto.setId(params.get("id"));
		dto.setBoard_class("프로필");
		dto.setBoard_num(0);

		String id = dto.getId();
		String board_class = dto.getBoard_class();
		int board_num = dto.getBoard_num();

		logger.info("방금 insert 한 id : "+id);
		logger.info("방금 insert 한 board_class : "+ board_class);
		
		String page = "myProPhotoList";
		
		if(!photo.getOriginalFilename().equals("")) {
			logger.info("파일 업로드 작업");
			proPhotoSave(id,board_class, photo,board_num);
		}	
		return page;
	}
	
	private void proPhotoSave(String id, String board_class, MultipartFile file, int board_num) {
		String ori_photo_name = file.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		String new_photo_name = System.currentTimeMillis()+ext;
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get("C:/img/upload/"+new_photo_name);
			Files.write(path, bytes);
			logger.info(new_photo_name+" save OK");
			dao.proPhotoSave(id,board_class,ori_photo_name,new_photo_name,board_num);						
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public MemberDTO myProPhotoList(String id) {
		logger.info("myProPhotoList id : " + id);
		String Board_class = "프로필";
		return dao.myProPhotoList(id,Board_class);
	}

	public void myProPhotoDel(String id, String board_class, int board_num) {
		String new_photo_name = dao.findFile(id,board_class);
		logger.info("file name : "+new_photo_name);
		// 2. 없다면?
		int row = dao.myProPhotoDel(id,board_class);
		logger.info("delete data : "+row);		
		
		if(new_photo_name != null && row >0) {// 3. 있다면? AND bbs 와  photo 가 확실히 삭제 되었는지?			
			File file = new File("C:/img/upload/"+new_photo_name);
			if(file.exists()) {// 2. 해당 파일이 존재 하는지?
				file.delete();
			}
		
		}
	}

	public MemberDTO findLoginPw(String id) {
		return dao.findLoginPw(id);
	}

	public MemberDTO login(String id) {
		return dao.login(id);
	}

	public MemberDTO myProPwUpdate(Object attribute) {
		return dao.myProPwUpdate(attribute);
	}

	public int changePw(String id, String changePw) {
		logger.info("changePw service" + id + " ? "+ changePw);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String changePw2 = encoder.encode(changePw);
		return dao.changePw(id,changePw2);
	}

	public ArrayList<MemberDTO> myBoardList(String id) {
		return dao.myBoardList(id);
	}

	
	
	
}
