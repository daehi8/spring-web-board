<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "home.model.board.BoardDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" scope="page" class="home.model.board.BoardDTO"/>
<jsp:setProperty name="article" property="*"/>

<%
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = BoardDAO.getInstance();
	int check = dao.updateArticle(article);
	
	if(check == 1){
%>	
		<meta http-equiv = "Refresh" content = "0;url=/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>">	
<%	}else{%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%}%>