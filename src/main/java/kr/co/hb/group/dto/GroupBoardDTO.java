package kr.co.hb.group.dto;

import java.sql.Date;

public class GroupBoardDTO {
	
	private int gidx;
	private String id;
	private String subject;
	private String content;
	private String big_hb;
	private String small_hb;
	private int minage;
	private int maxage;
	private String gender;
	private String city;
	private String area;
	private Date reg_date;
	private String meeting_date;
	private int bHit;
	private int photo_idx;
	private String new_photo_name;
	private String ori_photo_name;
	private String board_class;
	private int board_num;

	public int getPhoto_idx() {
		return photo_idx;
	}
	public void setPhoto_idx(int photo_idx) {
		this.photo_idx = photo_idx;
	}
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public String getOri_photo_name() {
		return ori_photo_name;
	}
	public void setOri_photo_name(String ori_photo_name) {
		this.ori_photo_name = ori_photo_name;
	}
	public String getBoard_class() {
		return board_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(String meeting_date) {
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
	public String getBig_hb() {
		return big_hb;
	}
	public void setBig_hb(String big_hb) {
		this.big_hb = big_hb;
	}
	public String getSmall_hb() {
		return small_hb;
	}
	public void setSmall_hb(String small_hb) {
		this.small_hb = small_hb;
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
