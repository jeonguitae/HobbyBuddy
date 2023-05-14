package kr.co.hb.admin.dto;

import java.util.Date;

public class NoticeDTO {

	   private int notice_idx;
	   private String id;
	   private String notice_title;
	   private String notice_content;   
	   private Date notice_date;
	   private int photoIdx;
	   private String new_photo_name;
	   private String board_class;
	   private String board_num;
	   private int notice_bHit;
	   private boolean notice_chk;
	
	   
	   public int getNotice_idx() {
	      return notice_idx;
	   }
	   public void setNotice_idx(int notice_idx) {
	      this.notice_idx = notice_idx;
	   }
	   public String getNotice_title() {
	      return notice_title;
	   }
	   public void setNotice_title(String notice_title) {
	      this.notice_title = notice_title;
	   }
	   public String getNotice_content() {
	      return notice_content;
	   }
	   public void setNotice_content(String notice_content) {
	      this.notice_content = notice_content;
	   }
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      this.id = id;
	   }
	   public Date getNotice_date() {
	      return notice_date;
	   }
	   public void setNotice_date(Date notice_date) {
	      this.notice_date = notice_date;
	   }
	   
	   public int getNotice_bHit() {
	      return notice_bHit;
	   }
	   public void setNotice_bHit(int notice_bHit) {
	      this.notice_bHit = notice_bHit;
	   }   
	   public boolean isNotice_chk() {
	      return notice_chk;
	   }
	   public void setNotice_chk(boolean notice_chk) {
	      this.notice_chk = notice_chk;
	   }
	public int getPhotoIdx() {
		return photoIdx;
	}
	public void setPhotoIdx(int photoIdx) {
		this.photoIdx = photoIdx;
	}
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public String getBoard_class() {
		return board_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	
}
