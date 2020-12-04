<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> start page </title>
</head>
<body>
<c:if test="${auto != null && id != null && pw != null }">
	<script> 
         window.location = "/home/cookiepro.do";
    </script>
</c:if>
    <div class="card">
		<h2>TITLE</h2>
		<h5>yymmdd</h5>
		<div class="fakeimg" style="height:200px;">Image</div>
		<p>text</p>
		<p>column</p>
    </div>
    <div class="card">
		<h2>TITLE</h2>
		<h5>yymmdd</h5>
		<div class="fakeimg" style="height:200px;">Image</div>
		<p>text</p>
		<p>column</p>
    </div>
    <div class="card">
		<h2>TITLE</h2>
		<h5>yymmdd</h5>
		<div class="fakeimg" style="height:200px;">Image</div>
		<p>text</p>
		<p>column</p>
    </div>
</body>
</html>