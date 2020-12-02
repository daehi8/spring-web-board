package home.model.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String fleg;
	private Timestamp reg;
	private String auto;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getAuto() {
		return auto;
	}
	public void setAuto(String auto) {
		this.auto = auto;
	}
	public String getFleg() {
		return fleg;
	}
	public void setFleg(String fleg) {
		this.fleg = fleg;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
}
