<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${result == true}">
	<script>
		alert("로그인 되었습니다.");
		window.location="/home/main.do";
	</script>
</c:if>
<c:if test="${result == false}">
	<script> 
	  alert("아이디나 비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>
