package kr.co.hb.member.dto;

import java.sql.Date;

public class MemberDTO {

	private String city;
	private String area;
	
	private String big_hb;
	private String small_hb;
	private int my_hobby_no;
	
	private String id;
	
	private String board_class;
	private String new_photo_name;
	private int board_num;
	private String ori_photo_name;
	private int photoIdx;
	
	private String pw;
	private boolean admin;
	
	private int fbNo;
	private String title;
	private Date fbTime;
	private int bhit;
	
	private String coContent;
	private Date coTime;
	
	public String getCoContent() {
		return coContent;
	}
	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}
	public Date getCoTime() {
		return coTime;
	}
	public void setCoTime(Date coTime) {
		this.coTime = coTime;
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
	public int getMy_hobby_no() {
		return my_hobby_no;
	}
	public void setMy_hobby_no(int my_hobby_no) {
		this.my_hobby_no = my_hobby_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard_class() {
		return board_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getOri_photo_name() {
		return ori_photo_name;
	}
	public void setOri_photo_name(String ori_photo_name) {
		this.ori_photo_name = ori_photo_name;
	}
	public int getPhotoIdx() {
		return photoIdx;
	}
	public void setPhotoIdx(int photoIdx) {
		this.photoIdx = photoIdx;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
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
	
}
