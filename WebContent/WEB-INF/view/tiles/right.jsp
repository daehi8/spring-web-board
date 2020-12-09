<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
  <div class="rightcolumn">
    <c:if test="${sessionScope.sessionId == null}">
    <div class="card">
      <input type="button" value="로그인" onclick="document.location.href='/home/loginform.do'">
      <input type="button" value="회원가입" onclick="document.location.href='/home/signup.do'">
    </div>
    </c:if>
    <c:if test="${sessionScope.sessionId != null}">
    <div class="card">
      <h2>${sessionScope.sessionId}</h2>
      <p>환영합니다</p>
      <input type="button" value="로그아웃" onclick="document.location.href='/home/logout.do'">
    </div>
    </c:if>
    
    <div class="card">
      <h3>Popular Post</h3>
      <div class="fakeimg"><p></p></div>
      <div class="fakeimg"><p></p></div>
      <div class="fakeimg"><p></p></div>
    </div>
    <div class="card">
      <h3>ad</h3>
      <p>ad</p>
    </div>
  </div>
  
</body>
</html>