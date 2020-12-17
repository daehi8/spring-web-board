<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="/home/resorce/css/write.css" rel="stylesheet">
<script src="/home/resorce/script/jquery-1.10.2.min.js"></script>
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
		<td>${number}</td>
		<td class="hd">조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr >
		<td class="hd">작성자</td>
		<td>${id}</td>
		<td class="hd">작성일</td>
		<td><fmt:formatDate value="${dto.reg_date}" type="both"/></td>
	</tr>
	<tr>
		<td class="hd">글제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td class="hd">글내용</td>
		<td colspan="3"><pre>${dto.content}</pre></td>
	</tr>
	<tr>
		<td class="hd" colspan="4" >
			<%-- 수정하거나 삭제할 페이지 번호 전송 --%>
	  		<input type="button" value="글수정" 
     		onclick="document.location.href='/home/board/updateform.do?no=${dto.no}&pageNum=${pageNum}'">
	 		&nbsp;&nbsp;&nbsp;&nbsp;
	 		
	 		<input type="button" value="글삭제" 
     		onclick="document.location.href='/home/board/deleteform.do?no=${dto.no}&pageNum=${pageNum}'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		
	  		<%-- 답글 쓰기 누를경우 값을 전송해 글쓰기와 구분 --%>
	  		<input type="button" value="답글쓰기" 
       		onclick="document.location.href='/home/board/writeform.do?no=${dto.no}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
	  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		
	  		<%-- 현재 글의 페이지를 확인해 위치한 페이지로 이동 --%>
	  		<input type="button" value="글목록" 
       		onclick="document.location.href='/home/board/list.do?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>

    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="board_no" value="${dto.no}"/>
               <input type="hidden" name="writer" value="${sessionScope.sessionId}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
<%@ include file="/resorce/script/replyJs.jsp" %>
  
</body>
