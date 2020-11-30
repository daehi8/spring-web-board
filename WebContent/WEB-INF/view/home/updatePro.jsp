<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.model.home.MemberDAO" %>
<%@ page import="home.model.home.MemberDTO" %>
<h2>update</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null){
			response.sendRedirect("main.jsp");
		}
	%>
	
	<jsp:useBean id="dto" class="home.model.home.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
			MemberDAO dao = new MemberDAO();
				dao.update(dto);
		%>
	<script>
		alert("수정되었습니다.");
		window.location="/home/home/main.jsp?main=loginHome.jsp";
	</script>