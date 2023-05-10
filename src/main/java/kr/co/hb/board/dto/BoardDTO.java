package kr.co.hb.board.dto;

import java.sql.Date;

public class BoardDTO {

	private int fbNo;
	private String title;
	private String id;
	private Date fbTime;
	private int bhit ;
	private String bContent;
	private int photo_idx;
	private String new_photo_name;
	private String ori_photo_name;
	private String board_class;
	private int board_num;
	private String big_hb;
	private String small_hb;
	
	

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
	public int getFbNo() {
		return fbNo;
	}
	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}
	public Date getFbTime() {
		return fbTime;
	}
	public void setFbTime(Date fbTime) {
		this.fbTime = fbTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	
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
	
	
	
	
}
