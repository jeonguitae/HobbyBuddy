package kr.co.hb.message.dto;

import java.sql.Date;

public class MessageDTO {

	private int msgNo;
	private String id_send;
	private String id_receive;
	private Date msg_time;
	private String msg_content;
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
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
	public Date getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Date msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	
	
}
