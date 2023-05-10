package kr.co.hb.group.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hb.group.dao.SmallGroupDAO;

@Service
public class SmallGroupService {
	
	@Autowired SmallGroupDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
}
