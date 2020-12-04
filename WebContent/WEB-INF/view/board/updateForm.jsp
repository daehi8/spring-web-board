<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.dto.BoardDTO" %>
<%@ page import = "home.model.dao.BoardDAO" %>
    
<head>
	<link href="../board/write.css" rel="stylesheet">
</head>
<body>
	<b>글수정</b>
	<br>
	<form method = "post" name = "writeForm" action = "/home/board/updatepro.do?pageNum=${pageNum}">
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type = "text" size="10" maxlength="10" name="writer" value="${dto.member_id}">
					<input type="hidden" name="num" value="${dto.no}">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="40" maxlength="50" name="subject" value="${dto.subject}">
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