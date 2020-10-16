package home.sign.model;

import java.sql.Timestamp;

public class SignupDTO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String nickname;
	private String num;
	private String email;
	private String email2;
	private String address;
	private String address2;
	private Timestamp reg;
	private String img;
	
	
	public void setId(String id) {
			this.id = id;	
	}
	public void setPw(String pw) {	
			this.pw = pw;
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
		this.email = email;	
	}
	public void setEmail2(String email2) {	
		this.email2 = email2; 
	}
	public void setAddress(String address) {	
		this.address = address;	
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

	
	public String getId() {	return id;	}
	public String getPw() {	return pw;	}
	public String getName() {	return name;	}
	public String getGender() {	return gender;	}
	public String getNickname() {	return nickname;	}
	public String getNum() {	return num;	}
	public String getEmail() {	return email;	}
	public String getEmail2() {	return email2;	}
	public String getAddress() {	return address;	}
	public String getAddress2() {	return address2;	}
	public Timestamp getReg() { return reg;	}
	public String getImg() {	return img;	}
}
