<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1> deleteForm</h1>

<c:if test="${sessionScope.sessionId == null}">
	<script>
		window.location = "/home/main.do"
	</script>
</c:if>

<form action = "/home/deletepro.do" method = "post">
		<input type= "hidden" name ="id" value = "${sessionScope.sessionId}" />
	pw : <input type = "text" name = "pw" /> <br/>
		<input type = "submit" value = "탈퇴"/>
</form>