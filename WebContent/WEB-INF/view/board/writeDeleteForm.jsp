<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	
    String sessionId = (String)session.getAttribute("id");
%>
	
<head>
	<link href="../board/write.css" rel="stylesheet" >
</head>
<body>
	<b>글삭제</b>
	<form method = "post" name = "delForm" action = "../board/writeDeletePro.jsp?pageNum=<%=pageNum%>">
	<input type="hidden" name="no" value="<%=no%>">
		<table>
			<tr>
				<td><b>삭제하시겠습니까?</b></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="글삭제" >
					<input type="button" value="글목록"
						onclick="document.location.href='/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
</body>