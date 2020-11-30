package home.model.board;
import java.sql.*;
import javax.sql.*;

import javax.naming.*;
import java.util.*;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {	// singleton
		return instance;
	}
	
	private Connection getConnection() throws Exception{
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	      return ds.getConnection();		
	}
	// 글작성
	public void insertArticle(BoardDTO article)	{
		int no=article.getNo();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
		String sql="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from homeboard");
			rs = pstmt.executeQuery();
						
			if(rs.next())					
				number = rs.getInt(1)+1;	 
			else
				number = 1;		
			
			if(no != 0) {

				sql ="update home_board set re_step = re_step+1 where ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
			}else {

				ref = number;
				re_step = 0;
				re_level = 0;
			}
			

            sql = "insert into home_board(no, member_no, member_id, subject, reg_date,";
		    sql+="ref, re_step, re_level, content, ip) values(board_seq.nextval,?,?,?,sysdate,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, article.getMember_no());
            pstmt.setString(2, article.getMember_id());
            pstmt.setString(3, article.getSubject());
            pstmt.setInt(4, ref);
            pstmt.setInt(5, re_step);
            pstmt.setInt(6, re_level);
			pstmt.setString(7, article.getContent());
			pstmt.setString(8, article.getIp());
			
            pstmt.executeUpdate();
		}catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
	}
	// 회원 고유번호 리턴
	public int getMemberNo() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select member_no from home_member where id =? and fleg =Y ");
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
	// 답변이 달린 글일경우 리턴
	public int notDeleteComment(int no) throws Exception { 	        
        int result = 0;
        try {
			conn = getConnection();
			String sql = 
					" select * from (select * from home_board "
					+ "where ref in (select ref "
					+ "from (select ref, count(ref) "
					+ "from home_board group by ref having count(ref) > '1'))) where no=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
        }catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
        return result;  
	}
	
	public int getArticleCount() throws Exception{
        int x=0;
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement("select count(*) from home_board");
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
	

	public List getArticles(int start, int end) throws Exception{
        List articleList=null;
        try {
        	conn = getConnection();
            pstmt = conn.prepareStatement(

            "select no,member_no,Member_id,subject,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
        	"from (select no,member_no,Member_id,subject,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
        	"from (select no,member_no,Member_id,subject,reg_date,ref,re_step,re_level,content,ip,readcount " +
        	"from home_board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
            pstmt.setInt(1, start);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();        	
        if(rs.next()) {
        	articleList = new ArrayList(end);
        	do{
                 BoardDTO article= new BoardDTO();
				 article.setNo(rs.getInt("num"));
				 article.setMember_no(rs.getInt("member_no"));
				 article.setMember_id(rs.getString("Member_id"));
                 article.setSubject(rs.getString("subject"));
			     article.setReg_date(rs.getTimestamp("reg_date"));
				 article.setReadcount(rs.getInt("readcount"));
                 article.setRef(rs.getInt("ref"));
                 article.setRe_step(rs.getInt("re_step"));
				 article.setRe_level(rs.getInt("re_level"));
                 article.setContent(rs.getString("content"));
			     article.setIp(rs.getString("ip")); 
				  
			     articleList.add(article);
        	 	 }while(rs.next());
        	}	
        }catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	closeAll();
        }
		return articleList;
	}
	

	public BoardDTO getArticle(int no) {
        BoardDTO article=null;
		try {
			conn = getConnection();
			
            pstmt = conn.prepareStatement(
            		"update home_board set readcount=readcount+1 where no = ?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
            pstmt = conn.prepareStatement(
            		"select * from home_board where no = ?");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                article = new BoardDTO();
                article.setNo(rs.getInt("no"));
				article.setMember_id(rs.getString("member_id"));
                article.setSubject(rs.getString("subject"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));
            }
	}catch(Exception ex) {
        ex.printStackTrace();
    }finally {
    	closeAll();
    }
	return article;
}
	
	public BoardDTO updateGetArticle(int no)throws Exception{
		BoardDTO article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
				"select * from home_board where no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDTO();
				article.setNo(rs.getInt("no"));
				article.setMember_id(rs.getString("member_id"));
				article.setSubject(rs.getString("subject"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip")); 
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return article;
	}
	
	

	public int updateArticle(BoardDTO article, int memNo)throws Exception{
		int dbMemNo = 0;
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
				"select member_no from home_board where no = ?");
			pstmt.setInt(1, article.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbMemNo = rs.getInt("member_no");
				if(dbMemNo==memNo) {
					sql = "update home_board set subject=?";
					sql += ",content=? where no=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(3, article.getSubject());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNo());
					pstmt.executeUpdate();
					x= 1;					
				}else{
					x= 0;
				}
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	// 글삭제
	public int deleteArticle(int no, int memberNo)throws Exception{
		int dbmemberNo = 0;
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select member_no from home_board where no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbmemberNo = rs.getInt("member_no");
				if(dbmemberNo == memberNo) {
					pstmt = conn.prepareStatement("delete from home_board where no =?");
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
					x= 1;
				}
			}else {
				x= 0;
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	public int deleteCommentArticle(int no, int memberNo)throws Exception{
		int dbmemberNo = 0;
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select member_no from home_board where no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbmemberNo = rs.getInt("member_no");
				if(dbmemberNo == memberNo) {
					pstmt = conn.prepareStatement(
							"update home_board set fleg ='D', subject ='삭제된 글입니다.', content='', member_id='', ip='' where no =?");
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
					x= 1;
				}
			}else {
				x= 0;
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			closeAll();
		}
		return x;
	}
	
	public int getMyListCount(int memNo) throws Exception{
        int y=0;
		try {
			 conn = getConnection();
			 BoardDTO article= new BoardDTO();
			 pstmt = conn.prepareStatement("select count(*) from home_board where member_no=?");
			 pstmt.setInt(1, memNo);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 y = rs.getInt(1);		
	         }
		}catch(Exception e) {
            e.printStackTrace();
        } finally {
        	closeAll();
        }
		return y;
	}

	private void closeAll() {
		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	}
}
