package kr.co.hb.admin.dto;

import java.util.Date;

public class SecretDTO {

	private int secret_no;
	private String sboard_class;
	private String sboard_num;
	private String sboard_title;
	private String writer_id;
	private String admin_id;		
	private boolean secret_state;
	private Date secret_time;
	
	public int getSecret_no() {
		return secret_no;
	}
	public void setSecret_no(int secret_no) {
		this.secret_no = secret_no;
	}
	public String getSboard_class() {
		return sboard_class;
	}
	public void setSboard_class(String sboard_class) {
		this.sboard_class = sboard_class;
	}
	public String getSboard_num() {
		return sboard_num;
	}
	public void setSboard_num(String sboard_num) {
		this.sboard_num = sboard_num;
	}
	public String getSboard_title() {
		return sboard_title;
	}
	public void setSboard_title(String sboard_title) {
		this.sboard_title = sboard_title;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public boolean isSecret_state() {
		return secret_state;
	}
	public void setSecret_state(boolean secret_state) {
		this.secret_state = secret_state;
	}
	public Date getSecret_time() {
		return secret_time;
	}
	public void setSecret_time(Date secret_time) {
		this.secret_time = secret_time;
	}
	
}
