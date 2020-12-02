<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>update</h2>

<c:if test="${sessionId == null}">
	<script>
		window.location="/home/main.do";
	</script>
</c:if>

<script>
	alert("수정되었습니다.");
	window.location="/home/main.do";
</script>