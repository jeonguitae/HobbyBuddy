package kr.co.hb.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hb.admin.service.SecretService;

@Controller
public class SecretController {

	@Autowired SecretService service;	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/secretList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> secretList(
			@RequestParam String page,
			@RequestParam String search			
			){
		
		return service.secretPageList(Integer.parseInt(page), search);
	}	
	
	/*
	 * @RequestMapping(value = "/secret_chk.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String update_chk(@RequestParam("sboard_num") String
	 * sboard_num,
	 * 
	 * @RequestParam("secret_state") String secret_state) { logger.info("컨트롤러 등장");
	 * logger.info("sboard_num : " + sboard_num); logger.info("secret_state : " +
	 * secret_state); return service.secret_ChkUpdate(sboard_num, secret_state); }
	 */

	@RequestMapping(value = "/secretSet.do")
	public String secretSet(@RequestParam int sboard_num) {
		
		
		
		return service.secretSet(sboard_num);
	}
}
