<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
			response.sendRedirect("cookiePro.jsp");			// 세션 생성
		}
%>
	<form action = "loginPro.jsp" method = "post">
		<input type = "button" onclick="window.location='signup01.jsp'" value ="회원가입">
		<input type = "button" onclick="window.location='loginForm.jsp'" value = "로그인">
		<input type="button" value ="게시판" onclick="window.location='/home/board/list.jsp'"/>
	</form>

    