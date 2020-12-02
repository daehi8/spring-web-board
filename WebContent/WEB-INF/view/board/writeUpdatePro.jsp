<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "home.model.dao.BoardDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" scope="page" class="home.model.dto.BoardDTO"/>
<jsp:setProperty name="article" property="*"/>

<%
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = BoardDAO.getInstance();
	int memNo = dao.getMemberNo();
	int check = dao.updateArticle(article, memNo);
		
	if(check == 1){
%>	
		<meta http-equiv = "Refresh" content = "0;url=/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>">	
<%	}else{%>
		<script>
			alert("작성자만 수정할 수 있습니다.");
			history.go(-1);
		</script>
<%}%>