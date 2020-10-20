<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<script>
	function deleteSave(){
		if(document.delForm.pw.value==''){
			alert("비밀번호를 입력하십시오.");
			document.delForm.pw.focus();
			return false;
		}
	}
</script>
<head>
	<link href="../board/write.css" rel="stylesheet" >
</head>
<body>
	<b>글삭제</b>
	<form method = "post" name = "delForm" action = "../board/writeDeletePro.jsp?pageNum=<%=pageNum%>">
		<table>
			<tr>
				<td><b>비밀번호를 입력해주세요.</b></td>
			</tr>
			<tr>
				<td>비밀번호 :
					<input type="password" name="pw" >
					<input type="hidden" name="num" value="<%=num%>">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="글삭제" >
					<input type="button" value="글목록"
						onclick="document.location.href='../board/list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
</body>