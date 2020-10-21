<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1> login home </h1>

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
			response.sendRedirect("cookiePro.jsp");			// 세션 생성
		}else{
			response.sendRedirect("loginForm2.jsp"); 		// 쿠키 = null -> flase
		}
	}
%>
	<button onclick="window.location='myInfo.jsp'">내정보 확인</button>
	<button onclick="window.location='logout.jsp'">로그아웃</button>
	<button onclick="window.location='delete.jsp'">회원탈퇴</button>
	<button onclick="window.location='../board/myList.jsp'">나의 작성글목록</button>
	<button onclick="window.location='../board/list.jsp'">게시판</button>