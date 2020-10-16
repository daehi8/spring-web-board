<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<h1>logout 페이지</h1>
	
	<%
		//로그아웃-세션 삭제
		session.invalidate(); // 연결된 모든 세션 삭제
		response.sendRedirect("loginForm.jsp");
	%>