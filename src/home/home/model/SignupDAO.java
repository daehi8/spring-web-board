package home.home.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.SQLException;
import java.util.ArrayList;

public class SignupDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static Connection getConnection() throws Exception{
		Context ctx = new InitialContext(); // Context xml ���� ����
		Context j = (Context)ctx.lookup("java:comp/env"); // �ڹ�������Ʈ ȯ�� ����(�ڹ� ����, �������� �����ϴ� ����)
		DataSource ds = (DataSource)j.lookup("jdbc/orcl"); // Ŀ�ؼ� Ǯ ���
		Connection conn = ds.getConnection();
		return conn;	
	}
	
	public ArrayList selectAll() {	
		ArrayList list = new ArrayList(); //resultSet����� ������ �迭
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup");
			rs = pstmt.executeQuery();
			while(rs.next()){
				SignupDTO dto = new SignupDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setNickname(rs.getString("nickname"));
				dto.setNum(rs.getString("num"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return list;
	}
	

	public void insert(SignupDTO dto) {
		try {
			conn = getConnection();
	    	String sql = "insert into signup values(?,?,?,?,?,?,?,?, sysdate,?)";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, dto.getId());
	    	pstmt.setString(2, dto.getPw());
	    	pstmt.setString(3, dto.getName());
	    	pstmt.setString(4, dto.getGender());
	    	pstmt.setString(5, dto.getNickname());
	    	pstmt.setString(6, dto.getNum());
	    	pstmt.setString(7, dto.getEmail());
	    	pstmt.setString(8, dto.getAddress());
	    	pstmt.setString(9, dto.getImg());
	    	
	    	pstmt.executeUpdate();
	    	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}		
	}
	
	public boolean selectId(String id) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from signup where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
	}
	
	
	public boolean loginCheck(SignupDTO dto) {
		boolean result = false;
		try{
			conn = getConnection();
			String sql = "select * from signup where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
	}	
	

	public SignupDTO idInfo(String Id) {
		SignupDTO dto = new SignupDTO();
		try{
			conn = getConnection();
			String sql = "select * from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setNum(rs.getString("num"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return dto;
	}	
	
	
	public SignupDTO myInfo(String sessionId) {
		SignupDTO dto = new SignupDTO();
		try{
			conn = getConnection();
			String sql = "select * from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setNum(rs.getString("num"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return dto;
	}
	
	public void update(SignupDTO dto) {
		try{
			conn = getConnection();
			String sql = "update signup set pw=?, name=?, gender=?, nickname=?, email=?, address=?, img=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			pstmt.setString(7, dto.getImg());
			pstmt.setString(8, dto.getId());
			pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}	
	}
	
    public void delete (SignupDTO dto){
    	try{
    		conn = getConnection();
    		String sql = "delete from signup where id=? and pw=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, dto.getId());
    		pstmt.setString(2, dto.getPw());
    		pstmt.executeUpdate();
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		closeAll();
    	}
    }
    
    
	public String selectImg(String id) {
		String img = null;
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select img from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				img = rs.getString("img");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return img;
	}

	
	public void deleteAdmin(String id) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "delete from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	
	private void closeAll() {
		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	}
}
