package kr.co.hb.mannertp.dto;

public class MannerTpDTO {
	
	private int tpNo;
	private String id_send;
	private String id_receive;
	private String tp_cal;
	
	private int sidx;
	private String id;
	
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTpNo() {
		return tpNo;
	}
	public void setTpNo(int tpNo) {
		this.tpNo = tpNo;
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
	public String getTp_cal() {
		return tp_cal;
	}
	public void setTp_cal(String tp_cal) {
		this.tp_cal = tp_cal;
	}
	
	
}
