package kr.co.hb.board.dto;

public class RandomDTO {
	private String id;
	private String name;
	private int age;
	private String gender;
	private String area;
	private String intr;
	private int mannertp;
	private boolean ban;
	private String new_photo_name;
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
	public String getNew_photo_name() {
		return new_photo_name;
	}
	public void setNew_photo_name(String new_photo_name) {
		this.new_photo_name = new_photo_name;
	}
	public boolean isBan() {
		return ban;
	}
	public void setBan(boolean ban) {
		this.ban = ban;
	}
	public int getMannertp() {
		return mannertp;
	}
	public void setMannertp(int mannertp) {
		this.mannertp = mannertp;
	}
	public String getIntr() {
		return intr;
	}
	public void setIntr(String intr) {
		this.intr = intr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}

	
}
