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
	   
	   private String id_send;
	   private String id_receive;
	   private String alarm_title;
	   private String alarm_content;
	   private String alarm_class;
	   private int alarm_num;
	   
	   
	
	   
	   public String getId_send() {
		return id_send;
	}
	public void setId_send(String id_send) {
		this.id_send = id_send;
	}
	public String getId_receive() {
		return id_receive;
	}
	public void setId_receive(String id_receive) {
		this.id_receive = id_receive;
	}
	public String getAlarm_title() {
		return alarm_title;
	}
	public void setAlarm_title(String alarm_title) {
		this.alarm_title = alarm_title;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public String getAlarm_class() {
		return alarm_class;
	}
	public void setAlarm_class(String alarm_class) {
		this.alarm_class = alarm_class;
	}
	public int getAlarm_num() {
		return alarm_num;
	}
	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}
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
