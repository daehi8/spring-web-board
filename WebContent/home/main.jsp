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
		String main = request.getParameter("main");
		if(main == null){
			main = "contents.jsp";
		}
		
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
			response.sendRedirect("/home/home/cookiePro.jsp");			// 세션 생성
		}
		String sessionId = (String)session.getAttribute("id");
	%>
	<table width="800" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<jsp:include page = "top.jsp" flush = "false" ></jsp:include>
			</td>
		</tr>
		<tr width = "150">
			<td>
				<%if(sessionId == null){%> 
					<input type = "button" value ="회원가입" onclick="window.location='/home/home/main.jsp?main=signup01.jsp'"/>
					<input type = "button" value = "로그인" onclick="window.location='/home/home/main.jsp?main=loginForm.jsp'"/>
					<input type="button" value ="게시판" onclick="window.location='/home/home/main.jsp?main=/board/list.jsp'"/>
				<%}else{%>
					<input type= "button" value="게시판" onclick="window.location='/home/home/main.jsp?main=/board/list.jsp'">
					<input type= "button" value="회원탈퇴"onclick="window.location='/home/home/main.jsp?main=delete.jsp'">
					<input type= "button" value="내정보확인" onclick="window.location='/home/home/main.jsp?main=myInfo.jsp'">
					<input type= "button" value="로그아웃" onclick="window.location='/home/home/main.jsp?main=logout.jsp'">
				<%}%>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<jsp:include page = "<%=main%>" flush = "false"></jsp:include>
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