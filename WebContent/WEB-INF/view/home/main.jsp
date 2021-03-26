<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="tiles" uri = "http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> start page </title>
</head>
<body>
	<tiles:importAttribute name="populerList"/>
	<tiles:importAttribute name="fileList"/>
	<c:forEach var="article" items="${populerList}" varStatus="status">
    <div class="card">
		<h2>${article.subject}</h2>
		<h5>${article.writer}</h5>
		<p>${article.reg_date}</p>
		<c:if test="${fileList[status.index].savename != 'nofile'}">
			<div class="fakeimg" style="height:200px;">
				<c:if test="${fileList[status.index].ext != '.png' && fileList[status.index].ext != '.jpg' &&  fileList[status.index].ext != '.jpeg'}">
				<img src="<c:url value="/resource/image/file.png" />" style="height:160px;">
				</c:if>
				<c:if test="${fileList[status.index].ext == '.png'|| fileList[status.index].ext == '.jpg' || fileList[status.index].ext == '.jpeg'}">
				<img src="<c:url value="save/${fileList[status.index].savename}"/>" style="height:160px;">
				</c:if>
			</div>
		</c:if>
		<c:if test="${fileList[status.index].savename == 'nofile'}"></c:if>
		<pre>${article.content}</pre>
    </div>
    </c:forEach>
</body>
</html>