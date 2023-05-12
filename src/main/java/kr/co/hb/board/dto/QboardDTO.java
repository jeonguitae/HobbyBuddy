package kr.co.hb.board.dto;

import java.util.Date;

public class QboardDTO {
	private int qboard_no;
	private String id;
	private String qboard_title;
	private String qboard_content;
	private String qboard_class;
	private Date qboard_time;
	private boolean qboard_openchk;
	private boolean qboard_state;
	private int answer_no;
	private String admin_id;
	private String answer_content;
	private Date answer_date;
	private int photo_idx;
	private String new_photo_name;
	private String ori_photo_name;
	private String board_class;
	private int board_num;
	
	
	public int getQboard_no() {
		return qboard_no;
	}
	public void setQboard_no(int qboard_no) {
		this.qboard_no = qboard_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQboard_title() {
		return qboard_title;
	}
	public void setQboard_title(String qboard_title) {
		this.qboard_title = qboard_title;
	}
	public String getQboard_content() {
		return qboard_content;
	}
	public void setQboard_content(String qboard_content) {
		this.qboard_content = qboard_content;
	}
	public String getQboard_class() {
		return qboard_class;
	}
	public void setQboard_class(String qboard_class) {
		this.qboard_class = qboard_class;
	}
	public Date getQboard_time() {
		return qboard_time;
	}
	public void setQboard_time(Date qboard_time) {
		this.qboard_time = qboard_time;
	}
	public boolean isQboard_openchk() {
		return qboard_openchk;
	}
	public void setQboard_openchk(boolean qboard_openchk) {
		this.qboard_openchk = qboard_openchk;
	}
	public boolean isQboard_state() {
		return qboard_state;
	}
	public void setQboard_state(boolean qboard_state) {
		this.qboard_state = qboard_state;
	}
	public int getAnswer_no() {
		return answer_no;
	}
	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
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
	
	
	
}
