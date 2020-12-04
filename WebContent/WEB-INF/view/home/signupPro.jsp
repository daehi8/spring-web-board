<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.dao.MemberDAO" %>
<%@ page import = "home.model.dto.MemberDTO" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h1> insert page </h1>


	<c:if test="${result == true}"> 
   		 <script>
    		alert("이미 등록되었습니다.");
    		window.location = "/home/signup.do";  
  		</script>
  	</c:if>
  	
    <c:if test="${result == false}">
    	<script>
    		alert("등록되었습니다.");
    		window.location = "/home/main.do";   
    	</script>
    </c:if>

