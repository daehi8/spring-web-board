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
			response.sendRedirect("/home/home/cookiePro.jsp");			// 세션 생성
		}
%>
	<form action = "/home/home/loginPro.jsp" method = "post">
		<input type = "button" value ="회원가입" onclick="window.location='/home/home/main.jsp?main=signup01.jsp'"/>
		<input type = "button" value = "로그인" onclick="window.location='/home/home/main.jsp?main=loginForm.jsp'"/>
		<input type="button" value ="게시판" onclick="window.location='/home/home/main.jsp?main=/board/list.jsp'"/>
	</form>

    