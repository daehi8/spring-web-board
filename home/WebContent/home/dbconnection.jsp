<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import = "home.sign.model.SignupDAO" %>
 <%@page import = "home.sign.model.SignupDTO" %>
 <%@page import = "java.util.ArrayList" %>
 
     	<%
    	SignupDAO dao = new SignupDAO();
    	ArrayList list = dao.selectAll();
    	
    	for(int i = 0; i < list.size(); i++){
    		SignupDTO dto = (SignupDTO)list.get(i);
    		%>
    	<h1>
    	<%=dto.getId() %> 
    	<%=dto.getPw() %> 
    	<%=dto.getName()%>
    	<%=dto.getNickname() %>
    	<%=dto.getGender() %>
    	<%=dto.getNum() %>
    	<%=dto.getEmail()%>
    	<%=dto.getAddress()%>
    	</h1>
    	<%}%>