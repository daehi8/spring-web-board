<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "home.model.dto.BoardDTO" %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>게시판</title>
		<link href="<c:url value="/resource/css/board.css" />" rel="stylesheet">
	</head>
<body>
	<div class="container">
		<b class="count">글목록(전체글:${page.count})</b>
		<table id ="Menu">
			<tr>
				<td>
						<input type= "button" class = "listbt" value = "글쓰기" onclick = "location.href='/home/board/writeform.do'"/>
				</td>
			</tr>
		</table>
		<c:if test="${page.count == 0}">
		<table id ="Board">
			<tr>
		    	<td>
		   		 	게시판에 저장된 글이 없습니다.
		    	</td>
		    <tr>
		</table>
		</c:if>
		<c:if test="${page.count > 0}">
			<table id ="Board">
				<tr class ="header">
					<td class="header" style="width:10%">번호</td>
					<td class="header" style="width:25%">제목</td>
					<td class="header" style="width:15%">작성자</td>
					<td class="header" style="width:30%">작성일</td>
					<td class="header" style="width:10%">조회</td>
					<td class="header" style="width:10%">IP</td>
				</tr>
				<c:set var ="idList" value="${memIdList}"/>
				<c:set var ="number" value="${page.number}"/>
				<c:forEach var="article" items="${articleList}">
				<tr>
					<td>${number}</td>
					<c:if test="${article.fleg eq 'Y'}">
						<td class ="subtd">
							<c:if test="${article.re_level > 0}">
								<%-- 답변 이미지 표시와 들여쓰기 --%>
								<img src="<c:url value="/resource/image/level.gif" />" width="${5 * article.re_level}">
								<img src="<c:url value="/resource/image/re.gif" />">
							</c:if>
							<c:if test="${article.re_level == 0}">
								<img src="<c:url value="/resource/image/level.gif" />" width="${5 * article.re_level}">
							</c:if>
							<%-- 제목 클릭시 내용 확인 --%>
							<a class ="subject" href ="/home/board/contents.do?no=${article.no}&pageNum=${page.currentPage}&number=${page.number}">
							${article.subject}</a>		
							<%-- 조회수가 20 이상일시 이미지 표시 --%>
							<c:if test ="${article.readcount >= 20}">
								<img src="<c:url value="/resource/image/hot.gif" />">
							</c:if>
						</td>
						<td>${article.writer}</td>					
						<%-- 작성 시간, 조회수, 작성IP 표시 --%>
						<td><fmt:formatDate value="${article.reg_date}" type="both"/></td>
						<td>${article.readcount}</td>
						<td>${article.ip}</td>
					</c:if>
					<c:if test="${article.fleg eq 'D'}">
						<td class ="subtd" colspan="5">
							<c:if test="${article.re_level > 0}">
								<%-- 답변 이미지 표시와 들여쓰기 --%>
								<img src="<c:url value="/resource/image/level.gif" />" width="${5 * article.re_level}">
								<img src="<c:url value="/resource/image/re.gif" />">
							</c:if>
							<c:if test="${article.re_level == 0}">
								<img src="<c:url value="/resource/image/level.gif" />" width="${5 * article.re_level}">
							</c:if>
							${article.subject}
						</td>
					</c:if>
				</tr>
				<c:set var="number" value="${number-1}"/>
				</c:forEach>
			</table>
		</c:if>
		<div class="center">
			<div class="pagination">
			    <c:if test="${page.startPage > 10}">
			        <a href="/home/board/list.do?pageNum=${page.startPage - 10}">&laquo;</a>
			    </c:if>
			        
		        <c:forEach var ="i" begin="${page.startPage}" end="${page.endPage}">
		        	<c:if test="${page.currentPage == i}">
			        	<a href="/home/board/list.do?pageNum=${i}" class="active">${i}</a>
					</c:if>
					<c:if test="${page.currentPage != i}">
			        	<a href="/home/board/list.do?pageNum=${i}">${i}</a>
			        </c:if>
				</c:forEach>
			        
		        <c:if test="${page.endPage < page.pageCount}">
			        <a href="/home/board/list.do?pageNum=${page.startPage + 10}">&raquo;</a>
		        </c:if>
			</div>
		</div>
	</div>
</body>
</html>







