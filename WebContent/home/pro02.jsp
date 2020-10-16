<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1> pro page2 </h1>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "signup" class = "home.sign.model.SignupDTO" />
<jsp:setProperty name = "signup" property = "*"/>

<h1>아이디 : <jsp:getProperty name = "signup" property = "id" /></h1>
<h1>비밀번호 : <jsp:getProperty name = "signup" property = "password" /></h1>
<h1>이름 : <jsp:getProperty name = "signup" property = "name" /></h1>
<h1>성별 : <jsp:getProperty name = "signup" property = "gender" /></h1>
<h1>닉네임 : <jsp:getProperty name = "signup" property = "nickname" /></h1>
<h1>전화번호 : <jsp:getProperty name = "signup" property = "number" /></h1>
<h1>
	이메일 : <jsp:getProperty name = "signup" property = "email" />@
	<jsp:getProperty name = "signup" property = "email2" />
</h1>
<h1>
	주소 : <jsp:getProperty name = "signup" property = "address" />
	<jsp:getProperty name = "signup" property = "address2"/>
</h1>