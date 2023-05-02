package kr.co.hb.member.dto;

public class MemberDTO {
	//m.id, m.name, m.email, m.phone, m.age, m.gender, m.city, m.area, m.mannertp, m.chkreq, m.chkresp, m.intr, m.random
	//,p.photoIdx, p.newFileName
	private String city;
	private String area;
	
	private String id;
	private String name;
	private String email;
	private String phone;
	private int age;
	private String gender;
	private int mannertp;
	private String chkreq;
	private String chkresp;
	private String intr;
	private String random;
	private int photoIdx;
	private String new_file_name;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getMannertp() {
		return mannertp;
	}
	public void setMannertp(int mannertp) {
		this.mannertp = mannertp;
	}
	public String getChkreq() {
		return chkreq;
	}
	public void setChkreq(String chkreq) {
		this.chkreq = chkreq;
	}
	public String getChkresp() {
		return chkresp;
	}
	public void setChkresp(String chkresp) {
		this.chkresp = chkresp;
	}
	public String getIntr() {
		return intr;
	}
	public void setIntr(String intr) {
		this.intr = intr;
	}
	public String getRandom() {
		return random;
	}
	public void setRandom(String random) {
		this.random = random;
	}
	public int getPhotoIdx() {
		return photoIdx;
	}
	public void setPhotoIdx(int photoIdx) {
		this.photoIdx = photoIdx;
	}
	public String getNew_file_name() {
		return new_file_name;
	}
	public void setNew_file_name(String new_file_name) {
		this.new_file_name = new_file_name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
}
