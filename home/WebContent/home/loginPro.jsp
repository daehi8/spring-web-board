<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "home.sign.model.SignupDAO"%>

<h2> log in</h2>

<jsp:useBean id = "dto" class = "home.sign.model.SignupDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	SignupDAO dao = new SignupDAO();
	boolean result = dao.loginCheck(dto);
	if(result){
		session.setAttribute("id", dto.getId());
		session.setAttribute("pw", dto.getPw());
		response.sendRedirect("loginHome.jsp");
	}else{
	%>
		<script>
			alert("아이디와 비밀번호를 확인하세요.");
			window.location="loginForm.jsp";
		</script>
	<%}%>
		