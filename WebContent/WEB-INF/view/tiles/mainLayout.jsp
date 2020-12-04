<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/home/resorce/css/main.css" rel="stylesheet">
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
