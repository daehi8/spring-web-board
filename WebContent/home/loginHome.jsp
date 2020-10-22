<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sessionId = (String)session.getAttribute("id");
	if(sessionId == null){ 		// 세션 = null -> true
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
			response.sendRedirect("../home/cookiePro.jsp");			// 세션 생성
		}else{
			response.sendRedirect("../home/loginForm2.jsp"); 		// 쿠키 = null -> flase
		}
	}
%>
	<input type= "button" onclick="window.location='/home/board/list.jsp'" value="게시판">
	<input type= "button" onclick="window.location='/home/home/delete.jsp'" value="회원탈퇴">
	<input type= "button" onclick="window.location='/home/home/myInfo.jsp'" value="내정보확인">
	<input type= "button" onclick="window.location='/home/home/logout.jsp'" value="로그아웃">