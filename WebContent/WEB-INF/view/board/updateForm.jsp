<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.dto.BoardDTO" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>     
<head>
	<link href="<c:url value="/resource/css/write.css" />" rel="stylesheet">
	<script>
	function div_hide() {
		document.getElementById("currFile").style.display = "none";
		document.getElementById("delFile").value = 1;
	}
	</script>
</head>
<body>
	<b>글수정</b>
	<br>
	<form method = "post" name = "writeForm" enctype="multipart/form-data" action = "/home/board/updatepro.do?pageNum=${pageNum}&${_csrf.parameterName}=${_csrf.token}">
	<sec:authentication property="principal" var="user"/>
	<input type="hidden" name="no" value="${dto.no}">
	<input type="hidden" name="writer" value="${user.username}">
	<sec:csrfInput/>
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="40" maxlength="50" name="subject" value="${dto.subject}">
				</td>
			</tr>
			<tr>
				<td>
					<input type ="hidden" id="delFile" name="delFile" value="0">	
					<c:if test="${fileDTO.orgname != null}">
						<div id="currFile">
							현재 파일 : ${fileDTO.orgname}
							<button type="button" onclick="div_hide();">삭제</button>/>
						</div>
					</c:if>
					<input type="file" name="save"/>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정" >
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기"
					onclick="document.location.href='/home/board/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>
</body>