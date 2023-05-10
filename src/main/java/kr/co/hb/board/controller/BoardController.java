package kr.co.hb.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.ObjectIdGenerators.StringIdGenerator;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value="/flist.go")
	public String list(Model model) {		
		logger.info("listcall");
		ArrayList<BoardDTO> list = service.list();
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
	public String fBoardDetail(Model model, @RequestParam int fbNo, HttpSession session) {
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
	   public String cowrite(@RequestParam HashMap<String, String> params, Model model, HttpSession session) {
	      logger.info("params" +params);
	      
	      String id= params.get("id");
	      String coContent = params.get("coContent");
	      int fbNo = (int) session.getAttribute("fbNo");
	      int row= service.cowrite(id, fbNo, coContent);
	      
	      ArrayList<BoardDTO> colist = service.colist(fbNo);
	      model.addAttribute("coList", colist);
	      logger.info("fbNo ? : " + fbNo);
	      return "fBoardDetail";
	   }
	
}

