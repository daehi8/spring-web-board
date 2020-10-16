<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <h1> pro page</h1>
    
    <%
    	String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	String gender = request.getParameter("gender");
    	String nickname = request.getParameter("nickname");
    	String number = request.getParameter("number");
    	String email = request.getParameter("email");
    	String email2 = request.getParameter("email2");
    	String address = request.getParameter("address");
    	String address2 = request.getParameter("address2");
    %>
    
    <h1> 아이디 = <%=id %> </h1>
    <h1> 비밀번호 = <%=password %> </h1>
    <h1> 이름 = <%=name %> </h1>
    <h1> 성별 = <%=gender %> </h1>
    <h1> 닉네임 = <%=nickname %> </h1>
    <h1> 휴대폰 번호 = <%=number %> </h1>
    <h1> 이메일 = <%=email%>@<%=email2%> </h1>
    <h1> 주소 = <%=address %><%=address2%> </h1>