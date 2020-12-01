<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.model.home.MemberDAO" %>
<%@ page import="home.model.home.MemberDTO" %>
    
    
	<%
        		String sessionId = (String)session.getAttribute("id");
        	        		if(sessionId == null){
        	        			response.sendRedirect("/home/main.do");
        	        		}
        	        		MemberDAO dao = new MemberDAO();
        	        		MemberDTO dto = dao.myInfo(sessionId);
        	%>
	
	<form action="/home/updatepro.do" method="post">
		아이디 : <%=dto.getId() %> <br />
			<input type="hidden" name="id" value="<%=dto.getId() %>" />
 		비밀번호 : <input type="text" name="pw" value="<%=dto.getPw() %>" /> <br />
		이름 : <input type="text" name="name" value="<%=dto.getName() %>" /> <br />
		이메일 : <input type="text" name="email" value="<%=dto.getEmail() %>" /> <br />
		가입날짜 : <%=dto.getReg() %> <br />
		<input type="hidden" name = "id" value="<%=dto.getId() %>"/>
		
		<input type="submit" value="수정하기">
	</form>