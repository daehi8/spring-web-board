<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<c:if test=${sessionId == null}>
	<script>
		window.location = "/home/main.do";
	</script>
</c:if>

<c:if test="${result == true}">
   	<script>
   		alert("탈퇴되었습니다");
   		window.location = "/home/main.do";
   	</script>
</c:if>
<c:if test="${result == false}">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		window.location = "/home/deleteform.do";
	</script>		
</c:if>