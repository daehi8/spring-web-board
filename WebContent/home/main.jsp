<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> start page </title>
</head>
<body>
	<%	
		String id = null, pw = null, auto = null;	// 쿠키 확인
		Cookie [] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("cid")) id = c.getValue();
				if(c.getName().equals("cpw")) pw = c.getValue();
				if(c.getName().equals("cauto")) auto = c.getValue();
			}
		}
		if (auto != null && id != null && pw != null){		// 쿠키가 있으면 -> true
			response.sendRedirect("loginPro.jsp");			// 세션 생성
		}
	%>
	<table width="800" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<jsp:include page = "top.jsp" flush = "false" ></jsp:include>
			</td>
			<td width = "150">
				<jsp:include page = "loginForm2.jsp" flush = "false"></jsp:include>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<jsp:include page = "contents.jsp" flush = "false"></jsp:include>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<jsp:include page = "bottom.jsp" flush = "false"></jsp:include>
			</td>
		</tr>				
	</table>

</body>
</html>