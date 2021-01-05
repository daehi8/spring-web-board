<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix ="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
  <div class="rightcolumn">
    <sec:authorize access="isAnonymous()">
    <div class="card">
      <input type="button" value="로그인" onclick="document.location.href='/home/loginform.do'">
      <input type="button" value="회원가입" onclick="document.location.href='/home/signup.do'">
    </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <div class="card">
    <sec:authentication property="principal" var="user"/>${user.username}
      <p>환영합니다</p>
      	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
		<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
		   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>
		<a href='/home/myinfo.do?id=${user.username}'>내정보</a>
		<a href='/home/deleteform.do'>회원탈퇴</a>
    </div>
   	</sec:authorize>
    
    <div class="card">
      <h3>Popular Post</h3>
      <tiles:importAttribute name="populerList"/>
      <c:forEach var="article" items="${populerList}">
      	<div class="fakeimg"><p>
      		제목 : <a href='/home/board/contents.do?no=${article.no}'>${article.subject}</a><br />
      		작성자 : ${article.writer}
      	</p></div>
      </c:forEach>
    </div>
  </div>
  
</body>
</html>