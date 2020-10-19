<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.board.BoardDTO"%>
<%@ page import = "home.board.BoardDAO"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO article = dao.getArticle(num);
		
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
%>
<body>
<form>
<table>
	<tr>
		<td>글번호</td>
		<td><%=article.getNum() %></td>
		<td>조회수</td>
		<td><%=article.getReadcount()%>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=article.getWriter() %></td>
		<td>작성일</td>
		<td><%=sdf.format(article.getReg_date())%></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td><%=article.getSubject()%></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td><pre><%=article.getContent() %></pre></td>
	</tr>
	<tr>
		<td>
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" value="답글쓰기" 
       		onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		<input type="button" value="글목록" 
       		onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
<%
	}catch(Exception e){}
%>
</form>
</body>