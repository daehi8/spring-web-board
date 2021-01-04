<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<head>
	<link href="/home/resource/css/write.css" rel="stylesheet">
</head>
<body>
	<b>글삭제</b>
	<form method = "post" name = "delForm" action ="/home/board/deletepro.do?pageNum=${pageNum}">
	<sec:authentication property="principal" var="user"/>
	<input type="hidden" name="no" value="${no}">
	<input type="hidden" name="writer" value="${user.username}">
	<sec:csrfInput/>
		<table>
			<tr>
				<td><b>삭제하시겠습니까?</b></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="글삭제" >
					<input type="button" value="글목록"
						onclick="document.location.href='/home/board/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>
</body>