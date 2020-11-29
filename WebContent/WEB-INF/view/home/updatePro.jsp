<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.home.model.SignupDAO" %>
<%@ page import="home.home.model.SignupDTO" %>
<h2>update</h2>
	<%
		request.setCharacterEncoding("UTF-8");
			String sessionId = (String)session.getAttribute("id");
			if(sessionId == null){
		response.sendRedirect("main.jsp");
			}
	%>
	
	<jsp:useBean id="dto" class="home.home.model.SignupDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		SignupDAO dao = new SignupDAO();
		dao.update(dto);
	%>
	<script>
		alert("수정되었습니다.");
		window.location="/home/home/main.jsp?main=loginHome.jsp";
	</script>