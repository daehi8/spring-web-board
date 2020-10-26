package home.product;
import java.sql.*;
import javax.sql.*;

import home.board.BoardDTO;
import home.sign.model.SignupDTO;

import javax.naming.*;
import java.util.*;

public class ProductDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {	// singleton
		return instance;
	}
	
	private Connection getConnection() throws Exception{
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	      return ds.getConnection();		
	}
	
	public int getAnimalsCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from animals");
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 x = rs.getInt(1);	
	         }
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return x;
	}
	
	
	public List getPets() {
		List petList = null;
		try {
        	conn = getConnection();
            pstmt = conn.prepareStatement("select * from animals");
            rs = pstmt.executeQuery();
            int count = 0;
            while(rs.next()) {
            	petList = new ArrayList();
            	ProductDTO dto = new ProductDTO();
            	dto.setNo(rs.getString("no"));
            	dto.setName(rs.getString("name"));
           		dto.setImg(rs.getString("img"));
           		dto.setMenual(rs.getString("menual"));
           		dto.setCity(rs.getString("city"));
           		dto.setKind(rs.getString("kind"));
           		dto.setReadcount(rs.getString("readcount"));
           		petList.add(dto);
           		count++;
           		if(count >= 4) {
           			break;
           		}
            }
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return petList;
	}
	
	public void insert(ProductDTO dto) {
		int no = Integer.parseInt(dto.getNo());
		int number = 0;
		String sql = "";
		try {
		conn = getConnection();
		pstmt = conn.prepareStatement("select max(no) from animals");
		rs = pstmt.executeQuery();
			
		if(rs.next())
			number = rs.getInt(1)+1;
		else
			number = 1;
		sql = "insert into animals(no, name, img, menual, city, kind)";
		sql += "values(animals_seq.nextval,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getImg());
		pstmt.setString(3, dto.getMenual());
		pstmt.setString(4, dto.getCity());
		pstmt.setString(5, dto.getKind());
		
		pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	public ProductDTO getproduct(int no) {
		ProductDTO dto=null;
		try {
			conn = getConnection();
			
            pstmt = conn.prepareStatement(
            		"update animals set readcount=readcount+1 where no = ?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
            pstmt = conn.prepareStatement(
            		"select * from animal where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                dto = new ProductDTO();
                dto.setNo(rs.getString("no"));
                dto.setName(rs.getString("name"));
                dto.setImg(rs.getString("img"));
                dto.setMenual(rs.getString("menual"));
                dto.setCity(rs.getString("city"));
                dto.setKind(rs.getString("kind"));
                dto.setReadcount(rs.getString("readcount"));
            }
	}catch(Exception ex) {
        ex.printStackTrace();
    }finally {
    	closeAll();
    }
	return dto;
}
	
	public boolean PocketCheck(String no) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from pocket where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return result;
	}
	
	public void Pocketinsert(PocketDTO dto) {
		try {
			conn = getConnection();
	    	String sql = "insert into pocket values(?,?,?)";
	    	pstmt.executeUpdate();
	    	pstmt.setString(1, dto.getNum());
	    	pstmt.setString(2, dto.getId());
	    	pstmt.setString(3, dto.getNo());
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

