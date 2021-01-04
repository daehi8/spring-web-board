<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<h1> deleteForm</h1>

<form action = "/home/deletepro.do" method = "post">
	<sec:authentication property="principal" var="user"/>
	<sec:csrfInput/>
		<input type= "hidden" name ="id" value = "${user.username}" />
	pw : <input type = "text" name = "pw" /> <br/>
		<input type = "submit" value = "탈퇴"/>
</form>