<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.board.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pw = request.getParameter("pw");
	
	BoardDAO dao = BoardDAO.getInstance();
	int check = dao.deleteArticle(num, pw);
	
	String id = (String)session.getAttribute("id");
	if(id.equals("admin")){%>
		<meta http-equiv="Refresh" content="0;url=../board/list.jsp?pageNum=<%=pageNum%>" >		
	<%}%>
	<%if(check == 1){%>
		  <meta http-equiv="Refresh" content="0;url=../board/list.jsp?pageNum=<%=pageNum%>" >
	<%}else{%>
		<script>            
	         alert("비밀번호가 맞지 않습니다");
	         history.go(-1);
	    </script>
	<%}%>