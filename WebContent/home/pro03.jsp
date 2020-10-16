<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="home.sign.model.SignupDTO" %>
<%@ page import="home.sign.model.SignupDAO" %>


<%
	SignupDAO dao = new SignupDAO();
	ArrayList list = dao.selectAll();
	if(list.size() > 0){
		for(int i = 0; i < list.size(); i++){
			SignupDTO dto = (SignupDTO)list.get(i);
			%><%=dto.getId() %> - 
			<%=dto.getPw() %> -
			<%=dto.getName() %> -
			<%=dto.getGender()%>
			<%=dto.getNickname() %> -
			<%=dto.getNum() %> -
			<%=dto.getEmail() %> -
			<%=dto.getAddress() %><br />
			
		<%}
	}
%>    