package kr.co.hb.main.dto;

import java.sql.Date;

public class MainDTO {
	private String id;
	private String phone;
	private String chkreq;
	private String chkresp;
	
	private int rept_no;
	private String reptboard_class;
	private int reptboard_num;
	private String rept_title;
	private Date rept_date;
	
	
	
	public int getRept_no() {
		return rept_no;
	}
	public void setRept_no(int rept_no) {
		this.rept_no = rept_no;
	}
	public String getReptboard_class() {
		return reptboard_class;
	}
	public void setReptboard_class(String reptboard_class) {
		this.reptboard_class = reptboard_class;
	}
	public int getReptboard_num() {
		return reptboard_num;
	}
	public void setReptboard_num(int reptboard_num) {
		this.reptboard_num = reptboard_num;
	}
	public String getRept_title() {
		return rept_title;
	}
	public void setRept_title(String rept_title) {
		this.rept_title = rept_title;
	}
	public Date getRept_date() {
		return rept_date;
	}
	public void setRept_date(Date rept_date) {
		this.rept_date = rept_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChkreq() {
		return chkreq;
	}
	public void setChkreq(String chkreq) {
		this.chkreq = chkreq;
	}
	public String getChkresp() {
		return chkresp;
	}
	public void setChkresp(String chkresp) {
		this.chkresp = chkresp;
	}
	
	

}
