package home.product;
import java.sql.Timestamp;;

public class MypetDTO {
	private String my_no; //�Ծ� ������
	private String id;//���̵�
	private String name;//��ǰ�̸�
	private String city;//����
	private Timestamp reg;//�Ծ糯¥
	public String getMy_no() {
		return my_no;
	}
	public void setMy_no(String my_no) {
		this.my_no = my_no;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
}

