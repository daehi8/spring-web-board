package home.home.model;

import java.sql.Timestamp;

public class SignupDTO {
	private String id;
	private String pw;
	private String pw2;
	private String name;
	private String gender;
	private String nickname;
	private String num;
	private String email;
	private String email1;
	private String email2;
	private String address;
	private String address1;
	private String address2;
	private Timestamp reg;
	private String img;
	private String auto;
	
	public void setId(String id) {
			this.id = id;	
	}
	public void setPw(String pw) {	
			this.pw = pw;
	}
	public void setPw2(String pw2) {	
		this.pw2 = pw2;
}
	public void setName(String name) {	
		this.name = name;	
	}
	public void setGender(String gender) {	
		this.gender = gender;	
	}
	public void setNickname(String nickname) {	
		this.nickname = nickname;	
	}
	public void setNum(String num) {	
		this.num = num;	
	}
	public void setEmail(String email) {	
		if(email != null) {
			String []e = email.split("@");
			email1 = e[0];
			email2 = e[1];
		}
		this.email = email;	
	}
	public void setEmail1(String email1) {	
		this.email1 = email1;
	} 
	public void setEmail2(String email2) {	
		this.email2 = email2; 
	}
	public void setAddress(String address) {
		if(address != null) {
			String []addr = address.split("-");
			address1 = addr[0];
			address1 = addr[1];
		}
		this.address = address;	
	}
	public void setAddress1(String address1) {	
		this.address1 = address1;	
	}
	public void setAddress2(String address2) {	
		this.address2 = address2;	
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setAuto(String auto) {
		this.auto=auto;
	}
	
	public String getId() {	return id;	}
	public String getPw() {	return pw;	}
	public String getPw2() {	return pw2;	}
	public String getName() {	return name;	}
	public String getGender() {	return gender;	}
	public String getNickname() {	return nickname;	}
	public String getNum() {	return num;	}
	public String getEmail() {	
			email = getEmail1()+"@"+getEmail2();
			return email;	
	}
	public String getEmail1() {	return email1;	}
	public String getEmail2() {	return email2;	}
	public String getAddress() {
		address = getAddress1()+"-"+getAddress2();
		return address;	
		}
	public String getAddress1() {	return address1;	}
	public String getAddress2() {	return address2;	}
	public Timestamp getReg() { return reg;	}
	public String getImg() {	return img;	}
	public String getAuto() {	return auto;	}
}
