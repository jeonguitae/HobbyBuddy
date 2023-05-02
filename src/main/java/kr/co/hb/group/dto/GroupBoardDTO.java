package kr.co.hb.group.dto;

import java.sql.Date;

public class GroupBoardDTO {
	
	private int gidx;
	private String id;
	private String subject;
	private String content;
	private String bhobby;
	private String mhobby;
	private int minage;
	private int maxage;
	private String gender;
	private String city;
	private String area;
	private Date reg_date;
	private Date meeting_date;
	private int bHit;
	
	public Date getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(Date meeting_date) {
		this.meeting_date = meeting_date;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	private int maxmem;
	private int mannertp;
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBhobby() {
		return bhobby;
	}
	public void setBhobby(String bhobby) {
		this.bhobby = bhobby;
	}
	public String getMhobby() {
		return mhobby;
	}
	public void setMhobby(String mhobby) {
		this.mhobby = mhobby;
	}
	public int getMinage() {
		return minage;
	}
	public void setMinage(int minage) {
		this.minage = minage;
	}
	public int getMaxage() {
		return maxage;
	}
	public void setMaxage(int maxage) {
		this.maxage = maxage;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getMaxmem() {
		return maxmem;
	}
	public void setMaxmem(int maxmem) {
		this.maxmem = maxmem;
	}
	public int getMannertp() {
		return mannertp;
	}
	public void setMannertp(int mannertp) {
		this.mannertp = mannertp;
	}
	
}
