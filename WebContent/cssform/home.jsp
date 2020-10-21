<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> start page </title>
</head>
<body>

	<table width="800" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<jsp:include page = "/home/top.jsp" flush = "false" ></jsp:include>
			</td>
			<td width = "150">
				<jsp:include page = "/home/loginHome.jsp" flush = "false"></jsp:include>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<jsp:include page = "/home/main.jsp" flush = "false"></jsp:include>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<jsp:include page = "/home/bottom.jsp" flush = "false"></jsp:include>
			</td>
		</tr>				
	</table>

</body>
</html>