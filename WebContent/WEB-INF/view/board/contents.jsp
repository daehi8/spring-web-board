<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link href="/home/resorce/css/write.css" rel="stylesheet">
	
	    <script type="text/javascript">
        function changeView(value)
        {
            if(value == 0)    
                location.href='BoardListAction.bo?page=${pageNum}';
            else if(value == 1)
                location.href='BoardReplyFormAction.bo?num=${board.board_num}&page=${pageNum}';
        }
        
        function doAction(value)
        {
            if(value == 0) // 수정
                location.href="BoardUpdateFormAction.bo?num=${board.board_num}&page=${pageNum}";
            else if(value == 1) // 삭제
                location.href="BoardDeleteAction.bo?num=${board.board_num}";
        }
        
 
        var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        }
        
        // 댓글 등록
        function writeReply()
        {
            var form = document.getElementById("writeReplyForm");
            
            var board = form.board_no.value
            var writer = form.writer.value
            var content = form.content.value;
            
            if(!content)
            {
                alert("내용을 입력하세요.");
                return false;
            }
            else
            {    
                var param="board_no="+board+"&writer="+writer+"&content="+content;
                    
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = checkFunc;
                httpRequest.open("POST", "writeReply.co", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
                httpRequest.send(param);
            }
        }
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){ 
                    document.location.reload(); // 상세보기 창 새로고침
                }
            }
        }
    
    </script>

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
<c:forEach var="replylist" items="${replylist}" varStatus="status">
    <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
          margin-left: ${20*replylist.depth}px; display: inline-block">   
       	${replylist.writer} ${replylist.reg_date}
        <a href="#" ${replylist.no}>삭제</a>
        <a href="#" ${replylist.no}>수정</a>
        <a href="#" onclick="replyOpne(${replylist.no})">답변</a>
        <br/>
    </div><br/>
</c:forEach>
<c:if test="${sessionScope.sessionId != null}">
	<tr>
	<form id="writeReplyForm">
		<input type="hidden" name="board_no" value="${dto.no}">
		<input type="hidden" name="writer" value="${sessionScope.sessionId}">
		아이디 : ${sessionScope.sessionId}
		<textarea name="content" rows="4" cols="70"></textarea>
		<a href="/home/board/insertReply.do" onclick="writeReply()">댓글등록</a>
	</form>
</c:if>
</body>
