package kr.co.hb.admin.controller;

import java.util.HashMap;

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
	
	@RequestMapping(value = "/secretList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> secretList(
			@RequestParam String page,
			@RequestParam String cnt			
			){
		
		return service.secretPageList(Integer.parseInt(page), Integer.parseInt(cnt));
	}	
	
	@RequestMapping(value = "/secret_chk.ajax", method = RequestMethod.POST)
	@ResponseBody
	public String update_chk(@RequestParam("notice_idx") String notice_idx,
	                         @RequestParam("flag") String flag) {
	  return service.secret_ChkUpdate(notice_idx, flag);
	}
	
}
