<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "home.board.BoardDAO" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="article" scope="page" class="home.board.BoardDTO"/>
<jsp:setProperty name="article" property="*"/>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	article.setIp(request.getRemoteAddr());

    BoardDAO dao = BoardDAO.getInstance();
    dao.insertArticle(article);

    response.sendRedirect("/home/home/main.jsp?main=/board/list.jsp");
%>
