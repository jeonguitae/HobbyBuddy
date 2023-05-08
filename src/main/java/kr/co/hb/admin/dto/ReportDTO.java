package kr.co.hb.admin.dto;

import java.util.Date;

public class ReportDTO {

	   private int report_idx;
	   private String preporter;
	   private String reporter;
	   private String admin_id;   
	   private String reptboard_class;   
	   private int reptboard_num;   
	   private String rept_title;   
	   private String rept_content;   
	   private Date rept_date;
	   private boolean rept_state;
	   private String newFileName;
	   private String proc_content;
	   private Date proc_date;
	   
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public String getPreporter() {
		return preporter;
	}
	public void setPreporter(String preporter) {
		this.preporter = preporter;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getReptboard_class() {
		return reptboard_class;
	}
	public void setReptboard_class(String reptboard_class) {
		this.reptboard_class = reptboard_class;
	}
	public int getReptboard_num() {
		return reptboard_num;
	}
	public void setReptboard_num(int reptboard_num) {
		this.reptboard_num = reptboard_num;
	}
	public String getRept_title() {
		return rept_title;
	}
	public void setRept_title(String rept_title) {
		this.rept_title = rept_title;
	}
	public String getRept_content() {
		return rept_content;
	}
	public void setRept_content(String rept_content) {
		this.rept_content = rept_content;
	}
	public Date getRept_date() {
		return rept_date;
	}
	public void setRept_date(Date rept_date) {
		this.rept_date = rept_date;
	}
	public boolean isRept_state() {
		return rept_state;
	}
	public void setRept_state(boolean rept_state) {
		this.rept_state = rept_state;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getProc_content() {
		return proc_content;
	}
	public void setProc_content(String proc_content) {
		this.proc_content = proc_content;
	}
	public Date getProc_date() {
		return proc_date;
	}
	public void setProc_date(Date proc_date) {
		this.proc_date = proc_date;
	}
	
}
