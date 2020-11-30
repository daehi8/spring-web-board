<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.board.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%	
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	
	int check = 0;
	
	BoardDAO dao = BoardDAO.getInstance();
	int refNo = dao.notDeleteComment(no);
	int memberNo = dao.getMemberNo();
	if(refNo != 0){
		check = dao.deleteCommentArticle(no, memberNo);	
	}else{
		check = dao.deleteArticle(no, memberNo);
	}
	String sessionId = (String)session.getAttribute("id");
	if("admin".equals(sessionId)){%>
		<meta http-equiv="Refresh" content="0;url=/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>" >		
	<%}%>
	<%if(check == 1){%>
		  <meta http-equiv="Refresh" content="0;url=/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>" >
	<%}else{%>
		<script>            
	         alert("작성자만 삭제할 수 있습니다.");
	         history.go(-1);
	    </script>
	<%}%>