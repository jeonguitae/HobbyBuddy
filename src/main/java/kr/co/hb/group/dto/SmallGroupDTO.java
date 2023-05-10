package kr.co.hb.group.dto;

import java.sql.Date;

public class SmallGroupDTO {
	
	private int sidx;
	private int gidx;
	private String id;
	private String sgsubject;
	private Date sgMeeting_date;
	private String city;
	private String area;
	private int maxmem;
	
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSgsubject() {
		return sgsubject;
	}
	public void setSgsubject(String sgsubject) {
		this.sgsubject = sgsubject;
	}
	public Date getSgMeeting_date() {
		return sgMeeting_date;
	}
	public void setSgMeeting_date(Date sgMeeting_date) {
		this.sgMeeting_date = sgMeeting_date;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getMaxmem() {
		return maxmem;
	}
	public void setMaxmem(int maxmem) {
		this.maxmem = maxmem;
	}
}
