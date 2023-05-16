package kr.co.hb.board.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.swing.AbstractListModel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.ObjectIdGenerators.StringIdGenerator;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;
import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	@Autowired MemberService mservice;
	@Autowired MemberService service2;
	
	@RequestMapping(value="/flist.go")
	public String list(Model model) {		
		logger.info("listcall");
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		ArrayList<BoardDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "fBoardList";
	}
	@RequestMapping(value="/fsorting.do")
	public String fsorting(Model model, @RequestParam HashMap<String, String> params) {
		
		logger.info("검색 조건 : " + params);
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<BoardDTO> list = service.fsorting(params);
		
		model.addAttribute("list", list);
		
		return "fBoardList";
	}
	@RequestMapping(value="/fsearch.do")
	public String fsearch(Model model, @RequestParam HashMap<String, String> params) {
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<BoardDTO> list = service.fsearch(params);
		
		model.addAttribute("list", list);
		return "fBoardList";
	}
	@RequestMapping(value="/fwrite.go")
	public String fBoardCreate(HttpSession session){
		logger.info("write");
		String id = (String) session.getAttribute("loginId");
		
		return "fBoardCreate";
	}
	@RequestMapping(value="/fwrite.do")
	public String fwrite(MultipartFile photo,@RequestParam HashMap<String, String> params){
		logger.info("fwrite"+params);
		return service.fwrite(photo,params,null);
	}
	@RequestMapping(value="/fdetail.do")
	public String fBoardDetail(Model model, @RequestParam int fbNo, HttpSession session, @RequestParam HashMap<String, String> params ) {
		String page = "";
		logger.info("상세페이지로 넘어는 옴?");
		//flag에 따라 조회수 해야 하니까
		
		BoardDTO dto=service.detail(fbNo,"detail");
		
		if (dto != null) {
			model.addAttribute("dto",dto);
			model.addAttribute("fbNo",fbNo);
			page = "fBoardDetail";
		}
		if (session.getAttribute("loginId")==null) {
			page = "fBoardList";			
		}
		session.setAttribute("fbNo", fbNo);
		
		ArrayList<BoardDTO> coList = new ArrayList<BoardDTO>();
		coList=service.coList(fbNo);
		model.addAttribute("coList",coList);
		logger.info("coList"+coList);
		return page;			
	}
	
	@RequestMapping(value="fdelete.do")
	public String fdelete(@RequestParam int fbNo) {
		service.fdelete(fbNo);
		//redirect로 안 하고 flist로 오면 초기화면 뜸
		return "redirect:/flist.go";
	}
	@RequestMapping(value="fupdate.go")
	public String updateform(Model model,@RequestParam int fbNo) {
		String page = "redirect:/flist.go";
		//그 fbNo갖고 있는 애를 update로 보내야하니까
		BoardDTO dto =service.detail(fbNo,"update");
		if (dto!=null) {
			model.addAttribute("dto",dto);
			
		}
		logger.info("업뎃가기 전"+dto);
		return "fBoardUpdate";
	}

	@RequestMapping(value="fupdate.do")
	public String fupdate(MultipartFile photo ,@RequestParam HashMap<String, String> params) {
		logger.info("업뎃 두 하기 전이양");
		return service.fupdate(photo, params);
	}
	@RequestMapping(value="fPhotodel.do")
	public String fphotodel(@RequestParam int fbNo, @RequestParam String board_class) {
		/*
		 * BoardDTO dto = new BoardDTO(); int board_num = dto.getFbNo();
		 */
		service.fphotodel(fbNo, board_class);
		logger.info("사진삭제할건데 row");
		return "redirect:/fupdate.go?fbNo="+fbNo;
	}
	
	@RequestMapping(value="/cowrite.do")
	public String cowrite(@RequestParam HashMap<String, String> params) {
		int row=service.cowrite(params);
		int fbNo=Integer.parseInt(params.get("fbNo"));
		logger.info("댓글쓰기"+row);
		
		String id_send = params.get("id");
		String id_receive = params.get("id_receive");
		String alarm_title = params.get("alarm_title");
		String alarm_content = params.get("coContent");
		String alarm_class = "자유";
		String alarm_num = params.get("alarm_num");
		
		service.coAlarm(id_send,id_receive,alarm_title,alarm_content,alarm_class,alarm_num);
		return "redirect:/fdetail.do?fbNo="+fbNo;
	}
	@RequestMapping(value="/codelete.go")
	public String codelete(@RequestParam int coNo, @RequestParam int fbNo) {
		logger.info("뽑았?"+coNo);
		int row=service.codelete(coNo);
		logger.info("댓삭"+row);
		return "redirect:/fdetail.do?fbNo="+fbNo;
	}

	@RequestMapping(value="/bmarklist.go")
	public String bmarkgo(HttpSession session, Model model) {
		logger.info("즐겨찾기로 이동 얍");
		String id = (String) session.getAttribute("loginId");
		ArrayList<BoardDTO> dto=service.bmarklist(id);
		logger.info("짜증나게 하네 진짜");
		
		if (dto!=null) {
			String msg = "즐겨찾기된 회원이 없습니다. 프로필 목록에서 즐겨찾기 해보세요.";
		}
		ArrayList<BoardDTO> bmarklist= service.bmarkselect(id);
		/* ArrayList<MemberDTO> big_hb = service2.big_hb(); */
		model.addAttribute("list", bmarklist);
		return "bmarkList";
	}
	
	@RequestMapping(value="/bmark.do")
	public String bmarkdo(@RequestParam String memid,@RequestParam String myid, Model model) {
		
		int row1= service.bmarkch(memid, myid);
		String msg = "이미 즐겨찾기한 회원입니다.";
		logger.info("비마크 : " + memid + myid);
		logger.info("row1"+row1);
		if (row1 == 0) {
			int row=service.bmarkdo(memid, myid);
			msg = "즐겨찾기되었습니다."; 
			logger.info("북마크함?"+ memid);
			logger.info("bmarkdo 됐으면 row는 1"+row);
		}
		model.addAttribute("msg", msg);
		
		return "redirect:/bmarklist.go";
	}
	/*
	 * @RequestMapping(value="/bmarkselect.do") public String
	 * bmarkselect(HashMap<String, String> params) { service.bmarkselect(params); }
	 */
	
}
	 


