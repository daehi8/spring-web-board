package home.model.home;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context j = (Context)ctx.lookup("java:comp/env"); 
		DataSource ds = (DataSource)j.lookup("jdbc/orcl"); 
		Connection conn = ds.getConnection();
		return conn;	
	}
	
	public ArrayList selectAll() {	
		ArrayList list = new ArrayList();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from home_member");
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
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
	

	public void insert(MemberDTO dto) {
		try {
			conn = getConnection();
	    	String sql = "insert into home_member values(board_seq.nextval,?,?,?,?,Y,sysdate)";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, dto.getId());
	    	pstmt.setString(2, dto.getPw());
	    	pstmt.setString(3, dto.getName());
	    	pstmt.setString(5, dto.getEmail());
	    	
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
			String sql = "select * from home_member where id = ? and fleg=Y";
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
	
	
	public boolean loginCheck(MemberDTO dto) {
		boolean result = false;
		try{
			conn = getConnection();
			String sql = "select * from home_member where id=? and pw=? and fleg=Y";
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
	

	public MemberDTO idInfo(String Id) {
		MemberDTO dto = new MemberDTO();
		try{
			conn = getConnection();
			String sql = "select * from home_member where id=? and fleg=Y";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return dto;
	}	
	
	
	public MemberDTO myInfo(String sessionId) {
		MemberDTO dto = new MemberDTO();
		try{
			conn = getConnection();
			String sql = "select * from home_member where id=? and fleg=Y";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return dto;
	}
	
	public void update(MemberDTO dto) {
		try{
			conn = getConnection();
			String sql = "update home_member set pw=?, name=?, email=? where id=? and fleg=Y";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(8, dto.getId());
			pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}	
	}
	
    public void delete (MemberDTO dto){
    	try{
    		conn = getConnection();
    		String sql = "update from home_member set fleg=D where id=? and pw=?";
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
    
	private void closeAll() {
		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	}
}
