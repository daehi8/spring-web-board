<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test="${reust==true}">
	<script>			
		window.location="/home/main.do";
	</script>
</c:if>
<c:if test="">
	<script>
		alert("아이디 / 비밀번호를 확인하세요.");			
		window.location="/home/loginform.do";
	</script>
</c:if>