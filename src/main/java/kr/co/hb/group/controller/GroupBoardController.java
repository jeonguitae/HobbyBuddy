package kr.co.hb.group.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hb.group.service.GroupBoardService;

@Controller
public class GroupBoardController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @RequestMapping(value="/gBoardList")
   public String list(Model model) {      
                  
      return "gBoardList";
   }

}