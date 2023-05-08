package kr.co.hb.alarm.dto;

import java.sql.Date;

public class AlarmDTO {
	private int alarm_no;
	private String id_send;
	private String id_receive;
	private String alarm_title;
	private String alarm_content;
	private Date alarm_time;
	private String alarm_class;
	private int alarm_num;
	
	private int fbNo;
	private String title;
	private String bContent;
	
	
	
	
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
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getAlarm_no() {
		return alarm_no;
	}
	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}
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
	public Date getAlarm_time() {
		return alarm_time;
	}
	public void setAlarm_time(Date alarm_time) {
		this.alarm_time = alarm_time;
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
	
	
	
}
