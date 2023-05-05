package kr.co.hb.member.dto;

import java.sql.Date;

public class MemberDTO {

	private String city;
	private String area;
	private String big_hb;
	private String small_hb;
	private int my_hobby_no;
	private String id;
	private String file_class;
	private String new_file_name;
	private String pw;
	private boolean admin;
	
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public int getFbNo() {
		return fbNo;
	}
	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getFbTime() {
		return fbTime;
	}
	public void setFbTime(Date fbTime) {
		this.fbTime = fbTime;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	private int fbNo;
	private String title;
	private Date fbTime;
	private int bhit;
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNew_file_name() {
		return new_file_name;
	}
	public void setNew_file_name(String new_file_name) {
		this.new_file_name = new_file_name;
	}
	public String getOri_file_name() {
		return ori_file_name;
	}
	public void setOri_file_name(String ori_file_name) {
		this.ori_file_name = ori_file_name;
	}
	public int getPhotoIdx() {
		return photoIdx;
	}
	public void setPhotoIdx(int photoIdx) {
		this.photoIdx = photoIdx;
	}
	private String ori_file_name;
	private int photoIdx;
	
	
	
	public String getFile_class() {
		return file_class;
	}
	public void setFile_class(String file_class) {
		this.file_class = file_class;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMy_hobby_no() {
		return my_hobby_no;
	}
	public void setMy_hobby_no(int my_hobby_no) {
		this.my_hobby_no = my_hobby_no;
	}
	public String getCity() {
		return city;
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
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
}
