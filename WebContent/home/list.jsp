<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.board.BoardDTO" %>
<%@ page import = "home.board.BoardDAO" %> 


<%!
	int pageSize = 10;	// 한 화면에 표시할 게시글 수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");	// 년-월-일 시:분
%>
<%
	// 첫페이지일시 1로 표시
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}
	
	// 
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;
    
    List articleList = null;
    BoardDAO dao = BoardDAO.getInstance();
    count = dao.getArticleCount();
    if(count > 0){
    	articleList = dao.getArticles(startRow, endRow);
    }
    
    number = count - (currentPage - 1) * pageSize;
%>
<html>
<body>   
<center><b>글목록(전체글:<%=count %>)</b>
<table>
	<tr>
		<td>
			<a href = "writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<% 
	if(count == 0){
%>
<table>
	<tr>
    	<td>
   		 	게시판에 저장된 글이 없습니다.
    	</td>
    <tr>
</table>
<% }else{ %>
<table>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회</td>
		<td>IP</td>
	</tr>
<%
	for(int i = 0; i < articleList.size(); i++) {
		BoardDTO article = (BoardDTO)articleList.get(i);
%>
	<tr>
		<td><%=number-- %></td>
		<td>
		<%
			int wid = 0;
			if(article.getRe_level() > 0){
				wid = 5 * (article.getRe_level());		
		%>
		<img src="images/level.gif">
		<img src="images/re.gif">
		<%}else{%>
		<img src="images/level.gif">
		<%}%>
	
		<a href ="contents01.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage %>">
		<%=article.getSubject()%></a>
		<% if(article.getReadcount()>=20){%>
		<img src="images/hot.gif"><%}%></td>
		<td>
			<a href="mailto:<%=article.getEmail() %>"><%=article.getWriter() %></a>
		</td>
		<td><%=sdf.format(article.getReg_date())%></td>
		<td><%=article.getReadcount() %></td>
		<td><%=article.getIp() %></td>
	</tr>
	<%}%>
</table>
<%}%>

<%
	if(count > 0) {
		// 필요한 전체 페이지 수 계산
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>







