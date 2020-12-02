<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.model.dto.BoardDTO" %>
<%@ page import = "home.model.dao.BoardDAO" %> 


<%!

	int pageSize = 10;	// 한 화면에 표시할 게시글 수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");	// 년-월-일 시:분
%>
<%
	// 페이지 처리식 (첫페이지일시 1로 표시)
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}
	
    int currentPage = Integer.parseInt(pageNum);		// 현재 페이지 - 페이지를 전달받은 값 IF(1)
    int startRow = (currentPage - 1) * pageSize + 1;	// 시작값 (1-1)*10+1
    int endRow = currentPage * pageSize;				// 종료값	1*10
    int count = 0;										// 전체 게시글 개수
    int number = 0;									 	// 게시판 글번호
    
    List articleList = null;
    BoardDAO dao = BoardDAO.getInstance();		
    count = dao.getArticleCount();
    if(count > 0){
    	articleList = dao.getArticles(startRow, endRow);	// 게시글 정렬
    }
    
 	// 게시판 글번호 처리 식  11-(1-1)*10													  
    number = count - (currentPage - 1) * pageSize;	
    String sessionId = (String)session.getAttribute("id");
%>
<html>
<head>
	<title>게시판</title>
	<link href="/home/board/write.css" rel="stylesheet">
</head>
<body>
<b>글목록(전체글:<%=count %>)</b>
<table>
	<tr>
		<td>
			<%if(sessionId != null){ %>
			<input type= "button" class = "listbt" value = "글쓰기" onclick = "location.href='/home/home/main.jsp?main=/board/writeForm.jsp'"/>
			<input type= "button" value="나의 작성글목록" onclick="window.location='/home/home/main.jsp?main=/board/myList.jsp'" />
			<%}else{%>
			<%}%>
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
	<tr class="hd">
		<td>번호</td>
		<td class = "listsubject_menu">제목</td>
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
		<td><%=number--%></td>
		<td class = "listsubject">
		<%
			int wid = 0;
			if(article.getRe_level() > 0){
				wid = 5 * (article.getRe_level());		
		%>
		<%-- 답변 이미지 표시와 들여쓰기 --%>
		<img src="/home/board/images/level.gif" width="<%=wid%>">
		<img src="/home/board/images/re.gif">
		<%}else{%>
		<img src="/home/board/images/level.gif" width="<%=wid%>">
		<%}%>
		
		<%-- 제목 클릭시 내용 확인 --%>
		if()
		<a href ="/home/board/contents.jsp?no=<%=article.getNo()%>&pageNum=<%=currentPage %>&number=<%=number%>">
		<%=article.getSubject()%></a>
		
		<%-- 조회수가 20 이상일시 이미지 표시 --%>
		<% if(article.getReadcount()>=20){%>
		<img src="/home/board/images/hot.gif"><%}%></td>
		
		<td>
			<%=article.getMember_id() %>
		</td>
		
		<%-- 작성 시간, 조회수, 작성IP 표시 --%>
		<td><%=sdf.format(article.getReg_date())%></td>
		<td><%=article.getReadcount() %></td>
		<td><%=article.getIp() %></td>
	</tr>
	<%}%>
</table>
<%}%>

<%
	if(count > 0) {
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);  // 전체 페이지 개수
		
        int startPage = (int)(currentPage/10)*10+1;							// 처음 페이지
		int pageBlock=10;													// 한화면에 표시되는 페이지 개수
        int endPage = startPage + pageBlock-1;								// 마지막 페이지
        if (endPage > pageCount) endPage = pageCount;						// 페이지가 10개 보다 적으면 페이지 수만큼만 표시
        
        // 현재 페이지에서 -10페이지
        if (startPage > 10) {    %>
        <a href="/home/home/main.jsp?main=/board/list.jsp&pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        
        // 페이지 숫자 설정
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="/home/home/main.jsp?main=/board/list.jsp&pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        
        // 현재 페이지에서 +10페이지
        if (endPage < pageCount) {  %>
        <a href="/home/home/main.jsp?main=/board/list.jsp&pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</body>
</html>






