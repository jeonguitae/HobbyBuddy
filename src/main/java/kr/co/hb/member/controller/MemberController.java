package kr.co.hb.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.main.controller.MainController;

import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	@Autowired MainController mainCont;

	@RequestMapping(value="/login.go")
	public String login() {
		logger.info("로그인 페이지 이동");
		return "login";
	}
	@RequestMapping(value="/join.go")
	public String join(Model model) {
		logger.info("회원가입 페이지 이동");
		ArrayList<MemberDTO> city = service.city();
		logger.info("city : " + city);
		model.addAttribute("city",city);		
		return "join";
	}
	@RequestMapping(value="/city.ajax")
	@ResponseBody
	public HashMap<String, Object> city(Model model, @RequestParam String city) {
		logger.info("도시 변경 : "+city);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MemberDTO> area = service.area(city);
		map.put("area", area);
		return map;
	}
	
	@RequestMapping(value="/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String id){
		logger.info("overlay : "+id);
		return service.overlay(id);
	}
	
	@RequestMapping(value="/join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.join(params);
	}
	
	@RequestMapping(value="/login.ajax")
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam String id,@RequestParam String pw, HttpSession session){
		logger.info(id+"/"+pw);
		
		MemberDTO dto = service.findLoginPw(id);		
		logger.info(dto.getPw());
		
		String encodedPassword = dto.getPw();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		boolean isMatched = encoder.matches(pw, encodedPassword);
		
		logger.info("비번 같음 ? " + isMatched);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(isMatched) {
			dto = service.login(id);
			logger.info("dto : " + dto.getId());
			session.setAttribute("loginId", id);
			session.setAttribute("adminChk", dto.isAdmin());
			map.put("member", dto);
		}

		return map;		
	}
	
	@RequestMapping(value="/pwChk.go")
	public String pwChk(Model model, HttpSession session) {
		return "pwChk";
	}
	
	@RequestMapping(value="/myProPwUpdate.go")
	public String myProPwUpdate(Model model, HttpSession session) {
		
		String page = "redirect:/";
		
		if(session.getAttribute("loginId") != null) {
			MemberDTO dto = service.myProPwUpdate(session.getAttribute("loginId"));			
			session.setAttribute("pw", dto.getPw());			
			page="myProPwUpdate";
		}
		
		return page;
	}
	
	@RequestMapping(value="/overlayNowPw.ajax")
	@ResponseBody
	public HashMap<String, Object> overlayNowPw(@RequestParam String nowPw, HttpSession session){
		logger.info("overlayNowPw nowPw : " + nowPw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String pw = (String) session.getAttribute("pw");		
		logger.info("overlayNowPw pw : " + pw);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean isMatched = encoder.matches(nowPw, pw);
		if(isMatched) {
			map.put("overlayNowPw", isMatched);
		}
		return map;		
	}
	
	@RequestMapping(value="/changePw.ajax")
	@ResponseBody
	public HashMap<String, Object> changePw(@RequestParam String changePw, HttpSession session){
		logger.info("changePw : " + changePw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("loginId");
		
		if(id != null) {
			logger.info("changePw id null..? : " + changePw + id);
			int success = service.changePw(id,changePw);
			map.put("success", success);
		}
		return map;		
	}
	
	@RequestMapping(value="/pwChk.ajax")
	@ResponseBody
	public HashMap<String, Object> pwChk2(@RequestParam String pw, HttpSession session){
		String id = (String) session.getAttribute("loginId");	
		logger.info(id+"/"+pw);		
		MemberDTO dto = service.findLoginPw(id);		
		logger.info(dto.getPw());		
		String encodedPassword = dto.getPw();		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();		
		boolean isMatched = encoder.matches(pw, encodedPassword);
		logger.info("비번 같음 ? " + isMatched);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(isMatched) {
			dto = service.login(id);
			logger.info("dto : " + dto.getId());
			session.setAttribute("loginId", id);
			map.put("member", dto);
		}
		return map;		
	}
	
	@RequestMapping(value="/mypage.go")
	public String mypage(Model model, HttpSession session) {
		ArrayList<MemberDTO> city = service.city();
		logger.info("city : " + city);
		model.addAttribute("city",city);
		return "myProDetail";
	}
	@RequestMapping(value="/myProDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> myProDetail(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		logger.info("myProDetail : "+ loginId);			
		HashMap<String, Object> map = service.myProDetail(loginId);
		logger.info("result : "+ map);
		
		MemberDTO dto = service.myProPhotoList(loginId);
		model.addAttribute("dto"+ dto);
		logger.info("dto",dto);
		
		return map;
	}
	@RequestMapping(value="/memberUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> memberUpdate(@RequestParam HashMap<String, String> params){
		logger.info("memberUpdate params : {}",params);
		return service.memberUpdate(params);		
	}
	@RequestMapping(value="/dropOut.ajax")
	@ResponseBody
	public void dropOut(@RequestParam String id, HttpSession session){
		logger.info("dropOut : "+id);
		service.dropOut(id);
		mainCont.logout(session);
	}
	
	@RequestMapping(value="/myHobbyList.go")
	public String myHobbyList(Model model) {
		logger.info("취미 등록 페이지 이동");
		ArrayList<MemberDTO> big_hb = service.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);		
		return "myHobbyList";
	}	
	
	@RequestMapping(value="/big_hb.ajax")
	@ResponseBody
	public HashMap<String, Object> big_hb(Model model, @RequestParam String big_hb) {
		logger.info("대분류 취미 변경 : "+big_hb);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MemberDTO> small_hb = service.small_hb(big_hb);
		map.put("small_hb", small_hb);
		return map;
	}

	@RequestMapping(value="/hbPlus.ajax")
	@ResponseBody
	public HashMap<String, Object> hbPlus(@RequestParam HashMap<String, String> params){
		logger.info("params : {}",params);
		return service.hbPlus(params);
	}
	
	@RequestMapping(value = "/myHobbyList.ajax")
	@ResponseBody
	public HashMap<String, Object> myHobbyList(HttpSession session, @RequestParam String id){		
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("loginId")!= null) {
			login = true;
			logger.info("session.getAttribute(\"loginId\") : " + session.getAttribute("loginId"));
			ArrayList<MemberDTO> myHobbyList = service.myHobbyList(id);
			map.put("myHobbyList", myHobbyList);
		}
		map.put("login", login);
		return map;
	}
	
	@RequestMapping(value="/myHobbyDel.ajax")
	@ResponseBody
	public HashMap<String, Object> myHobbyDel(@RequestParam(value="myHobbyDelList[]") ArrayList<String> myHobbyDelList){
		//array 로 받을 경우 @RequestParam 에 value 를 반드시 명시해야함
		logger.info("myHobbyDelList : "+myHobbyDelList);
		return service.myHobbyDel(myHobbyDelList);
	}
	
	@RequestMapping(value="/myProPhotoList.go")
	public String myProPhotoList(Model model, HttpSession session) {
		logger.info("프로필 사진 관리 페이지 이동");
		String id = (String) session.getAttribute("loginId");
		logger.info("myProPhotoList ID_session : " + session.getAttribute("loginId"));
		logger.info("myProPhotoList ID : " + id );
		
		MemberDTO dto = service.myProPhotoList(id);
		model.addAttribute("dto",dto);
		
		return "myProPhotoList";
	}
	
	@RequestMapping(value="/proPhotoUpload.do", method = RequestMethod.POST)
	public String proPhotoUpload(MultipartFile photo, @RequestParam HashMap<String, String> params) {
		logger.info("params : "+ params + " / photo : "+ photo);
		
		if(photo != null) {
			service.proPhotoUpload(photo, params);
		}
		return "redirect:/myProPhotoList.go";
	}
	
	
	@RequestMapping(value="/myProPhotoDel.do")
	public String myProPhotoDel(HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		String board_class = "프로필";
		int board_num = 0;
		service.myProPhotoDel(id,board_class,board_num);
		return "redirect:/myProPhotoList.go";
	}
	
	@RequestMapping(value = "/myBoardList.go", method = RequestMethod.GET)
	public String myBoardList(HttpSession session, Model model) {
		logger.info("myBoardList call");
		String id = (String) session.getAttribute("loginId");
		logger.info("myBoardList call : " + id);
		
		ArrayList<MemberDTO> myBoardList = service.myBoardList(id);
		if(myBoardList != null) {
			model.addAttribute("myBoardList", myBoardList);			
		}
		
		return "myBoardList";
	}

}
