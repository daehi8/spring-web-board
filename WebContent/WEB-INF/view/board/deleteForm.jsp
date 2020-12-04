<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link href="../board/write.css" rel="stylesheet" >
</head>
<body>
	<b>글삭제</b>
	<form method = "post" name = "delForm" action ="/home/board/deletepro.do?pageNum=${pageNum}">
	<input type="hidden" name="no" value="${no}">
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