<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> deleteForm</h1>
<%
	String sessionId = (String)session.getAttribute("id");
	if(sessionId == null){
	response.sendRedirect("loginForm.jsp");
}
%>
<form action = "deletePro.jsp" method = "post">
		<input type= "hidden" name ="id" value = "<%=sessionId%>" />
	pw : <input type = "text" name = "pw" /> <br/>
		<input type = "submit" value = "탈퇴"/>
</form>