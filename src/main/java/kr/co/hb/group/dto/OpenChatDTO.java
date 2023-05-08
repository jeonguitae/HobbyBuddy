package kr.co.hb.group.dto;

import java.sql.Time;

public class OpenChatDTO {
	
	private int gidx;
	private String id;
	private String chatting;
	private Time chattime;
	
	public Time getChattime() {
		return chattime;
	}
	public void setChattime(Time chattime) {
		this.chattime = chattime;
	}
	public String getChatting() {
		return chatting;
	}
	public void setChatting(String chatting) {
		this.chatting = chatting;
	}
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
	
}
