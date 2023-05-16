package kr.co.hb.group.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.group.dto.GroupBoardDTO;
import kr.co.hb.group.service.GroupBoardService;
import kr.co.hb.group.service.OpenChatService;
import kr.co.hb.member.dto.MemberDTO;
import kr.co.hb.member.service.MemberService;
import kr.co.hb.message.dto.MessageDTO;

@Controller
public class GroupBoardController {
	
	@Autowired GroupBoardService service;
	@Autowired OpenChatService oservice;
	@Autowired MemberService mservice;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value="/glist.go")
	public String list(Model model, HttpSession session) {
		
		logger.info("Gboard 이동");
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		logger.info("listcall");
		ArrayList<GroupBoardDTO> list = service.glist();
		
		model.addAttribute("list", list);
		
		String msg = (String) session.getAttribute("msg");
		String msg2 = (String) session.getAttribute("msg2");
		String msg3 = (String) session.getAttribute("msg3");
		
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		
		session.removeAttribute("msg");
		session.removeAttribute("msg2");

		return "gBoardList";
	}
	
	/*
	 * @RequestMapping(value="/gsorting.do") public String sorting(Model
	 * model, @RequestParam HashMap<String, String> params) {
	 * 
	 * logger.info("검색 조건 : " + params);
	 * 
	 * ArrayList<MemberDTO> big_hb = mservice.big_hb(); logger.info("big_hb : " +
	 * big_hb); model.addAttribute("big_hb",big_hb);
	 * 
	 * ArrayList<GroupBoardDTO> list = service.gsorting(params);
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return "gBoardList"; }
	 */
	
	@RequestMapping(value="/gsorting.do")
	public String sorting(@RequestParam(value = "big_hb", required = false) String bigHb,
            @RequestParam(value = "small_hb", required = false) String smallHb,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "city", required = false) String city,
            @RequestParam(value = "area", required = false) String area,
            @RequestParam(value = "meeting_date", required = false) String meetingDate,
            Model model) {		
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<GroupBoardDTO> list = service.gsorting(("".equals(bigHb) ? null : bigHb),
                ("".equals(smallHb) ? null : smallHb),
                ("".equals(gender) ? null : gender),
                ("".equals(city) ? null : city),
                ("".equals(area) ? null : area),
                ("".equals(meetingDate) ? null : meetingDate));
		
		model.addAttribute("list", list);
		
		return "gBoardList";
	}
	
	@RequestMapping(value="/gwrite.go")
	public String gwriteform(Model model, HttpSession session) {		
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		String loginId = (String) session.getAttribute("loginId");
		String page = "gBoardCreate";
		String msg = "";
		int hostchk = service.hostchk(loginId);
		
		logger.info("hostchk : " + hostchk);
		
		if(hostchk == 3) {
			
			page = "redirect:/glist.go";
			msg = "모임방은 회원 당 최대 3개까지만 개설 가능합니다";
			session.setAttribute("msg", msg);
		}

		return page;
	}
	
	@RequestMapping(value="/gwrite.do")
	public String gwrite(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {		
		
		logger.info("생성 데이터 : " + params);
		
		GroupBoardDTO dto = new GroupBoardDTO();
		
		dto.setArea(params.get("area"));
		dto.setCity(params.get("city"));
		dto.setBig_hb(params.get("big_hb"));
		dto.setSmall_hb(params.get("small_hb"));
		dto.setContent(params.get("content"));
		dto.setGender(params.get("gender"));
		dto.setId(params.get("id"));
		dto.setMannertp(Integer.parseInt(params.get("mannertp")));
		dto.setMinage(Integer.parseInt(params.get("minage")));
		dto.setMaxage(Integer.parseInt(params.get("maxage")));
		dto.setSubject(params.get("subject"));
		dto.setMeeting_date(params.get("meeting_date"));
		dto.setMaxmem(Integer.parseInt(params.get("maxmem")));
		int row = service.gwrite(dto);
		
		int gidx = dto.getGidx();
		String loginId = (String) session.getAttribute("loginId");
		
		if(row == 1) {
			int row1 = oservice.openlist(loginId, gidx);
		}
		
		return "redirect:/glist.go";
	}
	
	@RequestMapping(value="/gdetail.do")
	public String gdetail(Model model, @RequestParam int gidx, HttpSession session) {
		String page = "";
		
		logger.info("idx : " + gidx);
		GroupBoardDTO dto = service.gdetail(gidx, "detail");
		
		if (dto != null) {
			model.addAttribute("board", dto);
			page = "redirect:/gdetail.do?gidx="+gidx;
		}
		
		if (session.getAttribute("loginId")==null) {
			page = "gBoardList";
		}
		
		session.setAttribute("gidx", gidx);
		
		String msg = (String) session.getAttribute("msg");
		
		model.addAttribute("msg", msg);
		
		session.removeAttribute("msg");
		
		return "gBoardDetail";
	}

	@RequestMapping(value="/gserch.do")
	public String gserch(Model model, @RequestParam HashMap<String, String> params) {
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb",big_hb);
		
		ArrayList<GroupBoardDTO> list = service.gserch(params);
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/gupdate.go")
	public String gupdateForm(Model model, @RequestParam int gidx, @RequestParam String id, HttpSession session, HttpServletRequest req) {
		String page = "";
		
		String loginId = (String) session.getAttribute("loginId");
			
			logger.info("id : " + id);
			if(loginId.equals(id)) {
				
				page = "gBoardUpdate";
			}
			
			if(!loginId.equals(id)) {
				
				String msg = "모임 생성자만 수정 가능합니다";
				session.setAttribute("msg", msg);
				page = "redirect:/glist.go";
			}
		
		//그 fbNo갖고 있는 애를 update로 보내야하니까
		GroupBoardDTO dto = service.gdetail(gidx, "update");
		if (dto!=null) {
			
			model.addAttribute("board", dto);
		}
		
		ArrayList<MemberDTO> big_hb = mservice.big_hb();
		logger.info("big_hb : " + big_hb);
		model.addAttribute("big_hb", big_hb);
		
		return page;
	}
	
	@RequestMapping(value="gupdate.do")
	public String gupdate(MultipartFile photo ,@RequestParam HashMap<String, String> params) {
		
		return service.gupdate(photo, params);
	}
	
	@RequestMapping(value = "/greport.go", method = RequestMethod.GET)
	public String msgReport(HttpSession session, Model model, @RequestParam int gidx, @RequestParam String id_send, @RequestParam String content) {
		model.addAttribute("gidx", gidx);
		model.addAttribute("id_send", id_send);
		model.addAttribute("content", content);
		
		return "reportGroup";
	}
	
	@RequestMapping(value="/reportGroup.do")
	public String reportGroupDo(@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
		logger.info("report param ? " + params);
		int row = service.reportGroupDo(params);
		String msg = "";
		if(row == 1) {
			msg = "신고가 완료되었습니다.";
		}
		session.setAttribute("msg", msg);
		
		return "redirect:/glist.go";
	}
	
	@RequestMapping(value="gPhotodel.do")
	public String gdelete(@RequestParam int gidx, @RequestParam String id) {
		service.gpdelete(gidx);
		
		return "redirect:/gupdate.go?gidx="+gidx+"&id="+id;
	}
	
	@RequestMapping(value="myGroupList.go")
	public String myGroupList(Model model, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		ArrayList<GroupBoardDTO> list = service.myGroupList(loginId);
		
		model.addAttribute("list", list);
		
		return "myGroupList";
	}
	
	@RequestMapping(value="gdelete.do")
	public String gdelete(@RequestParam HashMap<String, String> params, HttpSession session) {
		String msg = "모임 생성자만 삭제 가능합니다";
		String id = params.get("id");
		int gidx = Integer.parseInt(params.get("gidx"));
		String page = "redirect:/gdetail.do?gidx=" + gidx;
		
		if(id.equals(session.getAttribute("loginId"))) {
			
			service.delopenlist(gidx);
			service.delchat(gidx);
			service.delsgroup(gidx);
			service.delsgmem(gidx);
			
			service.gdelete(gidx);
			
			page = "redirect:/glist.go";
			
			msg = "삭제완료";
			
		}
		
		session.setAttribute("msg", msg);
		
		return page;
	}
	
	@RequestMapping(value="/sportglist.go")
	public String sportglist(Model model) {
		
		ArrayList<GroupBoardDTO> list = service.sportglist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/petglist.go")
	public String petglist(Model model) {
		
		ArrayList<GroupBoardDTO> list = service.petglist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/foodglist.go")
	public String foodglist(Model model) {
		
		ArrayList<GroupBoardDTO> list = service.foodglist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/leisureglist.go")
	public String leisureglist(Model model) {
		
		ArrayList<GroupBoardDTO> list = service.leisureglist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	@RequestMapping(value="/etcglist.go")
	public String etcglist(Model model) {
		
		ArrayList<GroupBoardDTO> list = service.etcglist();
		
		model.addAttribute("list", list);
		return "gBoardList";
	}
	
	

}