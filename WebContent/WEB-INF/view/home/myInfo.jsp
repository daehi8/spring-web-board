<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <c:if test="${sessionScope.sessionId == null}">
    	<script>
    		window.loacation="/home/main.do";
    	</script>
    </c:if>

	<form action="/home/updatepro.do" method="post">
		아이디 : ${dto.getId()} <br />
 		비밀번호 : <input type="text" name="pw" value="${dto.getPw()}" /> <br />
		이름 : <input type="text" name="name" value="${dto.getName()}" /> <br />
		이메일 : <input type="text" name="email" value="${dto.getEmail()}" /> <br />
		가입날짜 : ${dto.getReg()} <br />
		<input type="hidden" name = "id" value="${dto.getId()}"/>
		
		<input type="submit" value="수정하기">
	</form>