<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.model.board.BoardDTO"%>
<%@ page import = "home.model.board.BoardDAO"%>

<%
	int number = Integer.parseInt(request.getParameter("number"));

	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO article = dao.getArticle(no);
		
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		
%>
<head>
	<link href="../board/write.css" rel="stylesheet">
</head>
<body>
<form>
<table>
	<tr>
		<td class="hd">글번호</td>
		<%--
		num이 시퀀스값을 포함해 삭제된 글의 값까지 가지고 있어 제대로 표시되지 않음.
		<td><%=article.getNum() %></td>
		--%>
		<td><%=number+1%></td>
		<td class="hd">조회수</td>
		<td><%=article.getReadcount()%>
	</tr>
	<tr >
		<td class="hd">작성자</td>
		<td><%=article.getMember_id() %></td>
		<td class="hd">작성일</td>
		<td><%=sdf.format(article.getReg_date())%></td>
	</tr>
	<tr>
		<td class="hd">글제목</td>
		<td colspan="3"><%=article.getSubject()%></td>
	</tr>
	<tr>
		<td class="hd">글내용</td>
		<td colspan="3"><pre><%=article.getContent() %></pre></td>
	</tr>
	<tr>
		<td class="hd" colspan="4" >
		<%
    	String sessionId = (String)session.getAttribute("id");
    	if (!"admin".equals(sessionId)){
    		if(sessionId.equals(article.getMember_id())){
    	%> 
			<%-- 수정하거나 삭제할 페이지 번호 전송 --%>
	  		<input type="button" value="글수정" 
     		onclick="document.location.href='/home/home/main.jsp?main=/board/writeUpdateForm.jsp&no=<%=article.getNo()%>&pageNum=<%=pageNum%>'">
	 		&nbsp;&nbsp;&nbsp;&nbsp;
	 		
	 		<input type="button" value="글삭제" 
     		onclick="document.location.href='/home/home/main.jsp?main=/board/writeDeleteForm.jsp&no=<%=article.getNo()%>&pageNum=<%=pageNum%>'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		
	  		<%-- 답글 쓰기 누를경우 값을 전송해 글쓰기와 구분 --%>
	  		<input type="button" value="답글쓰기" 
       		onclick="document.location.href='/home/home/main.jsp?main=/board/writeForm.jsp&no=<%=no%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		
			<%}%>
		<%}else{%>
			<%-- 답글 쓰기 누를경우 값을 전송해 글쓰기와 구분 --%>
		
			<input type="button" value="글삭제" 
     		onclick="document.location.href='/home/home/main.jsp?main=/board/writeDeletePro.jsp&no=<%=article.getNo()%>&pageNum=<%=pageNum%>'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
		<%}%>
		  		
	  		<%-- 현재 글의 페이지를 확인해 위치한 페이지로 이동 --%>
	  		<input type="button" value="글목록" 
       		onclick="document.location.href='/home/home/main.jsp?/board/list.jsp&pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
<%
	}catch(Exception e){}
%>
</form>
</body>