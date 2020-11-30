<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "home.model.board.BoardDTO" %>
<%@ page import = "home.model.board.BoardDAO" %>
    
<%
	// contents01.jsp에서 보낸 파라미터 확인
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO article = dao.updateGetArticle(num);
%>
<head>
	<link href="../board/write.css" rel="stylesheet">
</head>
<body>
	<b>글수정</b>
	<br>
	<form method = "post" name = "writeForm" action = "../board/writeUpdatePro.jsp?pageNum=<%=pageNum%>">
		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type = "text" size="10" maxlength="10" name="writer" value="<%=article.getMember_id()%>">
					<input type="hidden" name="num" value="<%=article.getNo()%>">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content"><%=article.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pw" size="8" maxlength="12">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정" >
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기"
					onclick="document.location.href='/home/home/main.jsp?main=/board/list.jsp&pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
<%}catch(Exception e){}%>
</body>