<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.model.dto.BoardDTO" %>
<%@ page import = "home.model.dao.BoardDAO" %> 
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>게시판</title>
	<link href="/home/resorce/css/write.css" rel="stylesheet">
</head>
<body>
<b>글목록(전체글:${page.count})</b>
<table>
	<tr>
		<td>
				<input type= "button" class = "listbt" value = "글쓰기" onclick = "location.href='/home/writeform.do'"/>
				<input type= "button" value="나의 작성글목록" onclick="window.location='/home/mylist.do'" />
		</td>
	</tr>
</table>
<c:if test="${page.count == 0}">
<table>
	<tr>
    	<td>
   		 	게시판에 저장된 글이 없습니다.
    	</td>
    <tr>
</table>
</c:if>
<c:if test="${page.count > 0}">
<table>
	<tr class="hd">
		<td>번호</td>
		<td class = "listsubject_menu">제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회</td>
		<td>IP</td>
	</tr>
</table>
<c:forEach var="article" items="${articleList}">
	<tr>
		<td>${page.number}</td>
		<td class = "listsubject">
			<c:if test="${article.Re_level > 0}">
				<%-- 답변 이미지 표시와 들여쓰기 --%>
				<img src="/home/board/images/level.gif" width="${wid}">
				<img src="/home/board/images/re.gif">
			</c:if>
			<c:if test="${article.Re_level = 0}">
				<img src="/home/board/images/level.gif" width="${5 * article.Re_level}">
			</c:if>
			<%-- 제목 클릭시 내용 확인 --%>
			<a href ="/home/board/contents.jsp?no=${article.no}pageNum=${page.currentPage}&number=${page.number}">
			${article.Subject}</a>		
			<%-- 조회수가 20 이상일시 이미지 표시 --%>
			<c:if test ="${article.readcount >= 20}">
				<img src="/home/board/images/hot.gif">
			</c:if>
		</td>

		<td>
			${article.member_id}
		</td>
		
		<%-- 작성 시간, 조회수, 작성IP 표시 --%>
		<td>${sdf.format(article.reg_date)}</td>
		<td>${article.readcount}></td>
		<td>${article.ip}</td>
	</tr>
</c:forEach>
</table>
</c:if>
    <c:if test="${page.startPage > 0}">
        <a href="/home/list.do?pageNum=${page.startPage - 10}">[이전]</a>
        </c:if>
        
        <c:forEach var ="i" begin="${page.startPage}" end="${page.endPage}">
        <a href="/home/list.do?pageNum=${i}">[${i}]</a>
		</c:forEach>
        
        <c:if test="${page.endPage > page.pageCount}">
        <a href="/home/list.do?pageNum=${page.startPage + 10}">[다음]</a>
        </c:if>
</body>
</html>







