<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1> login home </h1>

	<%
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null){
			response.sendRedirect("loginForm.jsp");
		}
	%>
	<h1>[<%=sessionId %>]님</h1>
	<button onclick="window.location='myInfo.jsp'">내정보 확인</button>
	<button onclick="window.location='logout.jsp'">로그아웃</button>
	<button onclick="window.location='deleteForm.jsp'">회원탈퇴</button>