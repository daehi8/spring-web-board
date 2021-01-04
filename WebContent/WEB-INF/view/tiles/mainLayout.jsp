<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<c:url value="/resource/css/main.css" />" type="text/css" rel="stylesheet">
</head>
<body>

<tiles:insertAttribute name="header"/>

<div class="row">
  <div class="leftcolumn">
  	<tiles:insertAttribute name="body"/>
  </div>
	<tiles:insertAttribute name="right"/>
</div>

<tiles:insertAttribute name="footer"/>

</body>
</html>
