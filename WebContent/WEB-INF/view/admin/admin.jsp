<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="home.home.model.SignupDTO"%>
<%@ page import="home.home.model.SignupDAO"%>

<%request.setCharacterEncoding("UTF-8"); %>

<%
	String sessionId = (String)session.getAttribute("id");
	if(sessionId == null){
	response.sendRedirect("loginForm.jsp");
	}
	SignupDAO dao = new SignupDAO();
	ArrayList list = dao.selectAll();
	
	if(list.size() > 0){
		for(int i=0; i<list.size(); i++){
			SignupDTO dto = (SignupDTO)list.get(i);
		%><a href ="myInfo.jsp?id=<%=dto.getId()%>"><%=dto.getId() %></a> / 
		<%=dto.getPw() %> / 
		<%=dto.getName() %> / 
		<%=dto.getGender() %> / 
		<%=dto.getNickname() %> /
		<%=dto.getNum() %> /
		<%=dto.getEmail() %> /
		<%=dto.getAddress() %> /
		<%=dto.getReg() %> /
		<a href = "deleteAdmin.jsp?id=<%=dto.getId()%>">탈퇴</a> <br />

	<%}
	}
%>