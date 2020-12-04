<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${check == 1}">
	<meta http-equiv = "Refresh" content = "0;url=/home/board/list.do?pageNum=${pageNum}">	
</c:if>
<c:if test="${check != 1}">
	<script>
		alert("작성자만 수정할 수 있습니다.");
		history.go(-1);
	</script>
</c:if>