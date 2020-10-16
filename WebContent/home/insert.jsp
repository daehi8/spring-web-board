<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.sign.model.SignupDAO" %> 

<h1> insert page </h1>

<%request.setCharacterEncoding("UTF-8");%>
	<jsp:useBean id="dto" class = "home.sign.model.SignupDTO"/>
    <jsp:setProperty property = "*" name = "dto"/>
    
	<%
	SignupDAO dao = new SignupDAO();
    boolean result = dao.selectNum(dto.getNum());
    if(result){
    	out.println("이미 등록되었습니다.");
    }else{
    	dao.insert(dto);
    	out.println("등록되었습니다.");
    }
	%>
