<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="home.sign.model.SignupDAO" %>
<%@ page import="home.sign.model.SignupDTO" %>
    
    
	<%
	String sessionId = (String)session.getAttribute("id");
	if(sessionId == null){
		response.sendRedirect("/home/home/main.jsp");
	}
	SignupDAO dao = new SignupDAO();
	SignupDTO dto = dao.myInfo(sessionId);
	%>
	
	<form action="updatePro.jsp" method="post">
		아이디 : <%=dto.getId() %> <br />
			<input type="hidden" name="id" value="<%=dto.getId() %>" />
 		비밀번호 : <input type="text" name="pw" value="<%=dto.getPw() %>" /> <br />
		이름 : <input type="text" name="name" value="<%=dto.getName() %>" /> <br />
		성별 : <input type="text" name="gender" value="<%=dto.getGender() %>" /> <br />
		전화번호 : <input type="text" name="num" value="<%=dto.getNum() %>" /> <br />
		이메일 : <input type="text" name="email" value="<%=dto.getEmail() %>" /> <br />
		주소 : <input type="text" name="address" value="<%=dto.getAddress() %>" /> <br />
		가입날짜 : <%=dto.getReg() %> <br />
		프로필 사진 : <input type="file" name="img" /> <br />
		<input type="hidden" name = "sysImg" value="<%=dto.getImg() %>"/>
		<input type="hidden" name = "id" value="<%=dto.getId() %>"/>
		<img src = "/web/save/<%=dto.getImg()%>"/>
		
		<input type="submit" value="수정하기">
	</form>