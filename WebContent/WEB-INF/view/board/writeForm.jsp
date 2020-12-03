<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style>
	table{	border :  3px solid black;}
</style>
   
<head>
	<link href="/resorce/css/write.css" rel="stylesheet">
</head>
<body>
<br>
<form method = "post" name = "writeform" action = "/home/writepro.do">
	<%-- 히든타입으로 만든 값을 pro페이지로 전송 --%>
	<input type="hidden" name="no" value="${no}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	
	<table>
		<tr>
			<td class="hd" colspan="2">글목록</td>
		</tr>
		<tr>
			<td class="hd">이름</td>
			<td class="writeId">${sessionId}<input type="hidden" name="writer" value = "${sessionId}"></td>			
		</tr>
		<tr>
			<td class="hd">제목</td>		
			<td>
			<c:if test="${no == 0}">
				<input type="text" size="40" maxlength="50" name="subject">
			</c:if>
			<c:if test="${no != 0}">
				<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
			</c:if>
			</td>
		</tr>
		<tr>
			<td class="hd">내용</td>		
			<td><textarea name="content" ></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기" >  
  				<input type="reset" value="다시작성">
  				<input type="button" value="목록보기" OnClick="window.location='/home/list.do'">
			</td>		
		</tr>										
	</table>
</form>
</body>