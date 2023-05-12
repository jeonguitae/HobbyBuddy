package kr.co.hb.mannertp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.hb.board.controller.RandomController;
import kr.co.hb.board.dto.BoardDTO;
import kr.co.hb.mannertp.dto.MannerTpDTO;

import kr.co.hb.mannertp.service.MannerTpService;

@Controller
public class MannerTpController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MannerTpService service;
	@Autowired RandomController rservice;
	
		
	@RequestMapping(value="/mannertp.do")
	public String mannertp(Model model, @RequestParam String id_receive, @RequestParam String tp_cal, HttpSession session) {
		logger.info("mannertp" + id_receive + " / " + tp_cal);

		String id_send = (String) session.getAttribute("loginId");
				
		MannerTpDTO dto = service.mannerChk(id_receive,id_send,tp_cal);
		

		String msg = "이미 매너온도를 평가한 적이 있는 회원입니다. 매너온도 삭제 후 이용해주세요 !";

		
		if(dto!=null) {
			String id_r = dto.getId_receive();
			String id_s = dto.getId_send();
			int tpNo = dto.getTpNo();
			String tp_c = dto.getTp_cal();
			logger.info("mannerChk : " + id_r + id_s + tpNo);
			
			if(tp_cal.equals("del")) {
				service.mannertpDel(id_r,id_s);
				msg = "매너온도를 다시 평가할 수 있어요 !";
				if(tp_c.equals("plus")) {
					service.mannertpM(id_r);
				}
				if(tp_c.equals("minus")) {
					service.mannertpP(id_r);
				}
			}
		}		
		
		if(dto==null) {
			msg = "매너온도를 평가한 적이 없는 회원입니다. 매너온도를 평가해주세요 !";
			if(tp_cal.equals("plus")) {
				service.mannertpUp(id_receive);
				service.mannertpUp2(id_receive,id_send,"plus");
				msg="매너온도를 올려주었어요 !";
			}
			
			if(tp_cal.equals("minus")) {
				service.mannertpDown(id_receive);
				service.mannertpDown2(id_receive,id_send,"minus");
				msg="매너온도를 내렸어요 !";
			}			
			
		}
		model.addAttribute("msg",msg);
		rservice.detail(id_receive,model);
		
		return "proDetail";
	}
}
