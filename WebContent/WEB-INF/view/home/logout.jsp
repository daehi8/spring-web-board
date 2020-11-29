<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<h1>logout 페이지</h1>
	
	<%
		//로그아웃-세션 삭제
		session.invalidate(); // 연결된 모든 세션 삭제
		Cookie [] cookies = request.getCookies();	
		if(cookies != null){						// 쿠키가 있으면 = true
			for(Cookie c : cookies){				// 쿠키 id, pw, auto 삭제 후 메인으로 이동
				if(c.getName().equals("cid")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if(c.getName().equals("cpw")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
				if(c.getName().equals("cauto")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}%>
	<script>            
        alert("로그아웃되었습니다.");
        history.go(-1);
   </script>
