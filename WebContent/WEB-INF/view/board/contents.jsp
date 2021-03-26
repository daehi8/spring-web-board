<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<head>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<link href="<c:url value="/resource/css/write.css" />" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<form>
<table>
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
			<td class="hd">파일</td>
			<td>
				<c:if test="${fileDTO.orgname != null}">
					<a href="/home/file/download.do?no=${fileDTO.no}">${fileDTO.orgname}</a>
				</c:if>
			</td>
			<td class="hd">조회수</td>
			<td>${dto.readcount}</td>
		</tr>
	<tr>
		<td class="hd">글내용</td>
		<td colspan="3"><pre>${dto.content}</pre></td>
	</tr>
	<tr>
		<td class="hd" colspan="4" >
			<%-- 수정하거나 삭제할 페이지 번호 전송 --%>
			<sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="user"/>
		  		<c:if test="${dto.writer eq user.username }">
			  		<input type="button" value="글수정" 
		     		onclick="document.location.href='/home/board/updateform.do?no=${dto.no}&pageNum=${pageNum}'">
			 		&nbsp;&nbsp;&nbsp;&nbsp;
			 		
			 		<input type="button" value="글삭제" 
		     		onclick="document.location.href='/home/board/deleteform.do?no=${dto.no}&pageNum=${pageNum}'">
			  		&nbsp;&nbsp;&nbsp;&nbsp;
		  		</c:if>
		  		
		  		<%-- 답글 쓰기 누를경우 값을 전송해 글쓰기와 구분 --%>
		  		<input type="button" value="답글쓰기" 
	       		onclick="document.location.href='/home/board/writeform.do?no=${dto.no}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
		  		&nbsp;&nbsp;&nbsp;&nbsp;
	  		</sec:authorize>
	  		
	  		<%-- 현재 글의 페이지를 확인해 위치한 페이지로 이동 --%>
	  		<input type="button" value="글목록" 
       		onclick="document.location.href='/home/board/list.do?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>

    <div class="container">
        <label for="content"></label>
        <h1>comment</h1>
        <form name="commentInsertForm" onsubmit="return false;">
            <div class="input-group">
               <sec:authorize access="isAuthenticated()">
               <sec:authentication property="principal" var="user"/>
               <input type="hidden" name="writer" value="${user.username}"/>
               </sec:authorize>
               <input type="hidden" name="board_no" value="${dto.no}"/>
               <textarea class="form-control" id="insertContent" name="content" placeholder="내용을 입력하세요."></textarea>
            </div>
             <div class="input-insert">
              <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
              </span>
          	</div>
        </form>
    </div>

    <div class="container">
        <div class="commentList"></div>
    </div>
<script>
var boardNo = '${dto.no}'; //게시글 번호
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var writer = '${user.username}';

$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
         xhr.setRequestHeader(header,token);
    });
});

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

//댓글 목록 
function commentList(boardNo){
    $.ajax({
        url : '/home/board/listreply.do',
        type : 'get',
        data : {'boardNo':boardNo},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){
            	var depth = value.depth * 40;
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px; margin-left:'+depth+'px;">';
                a += '<div class="commentInfo'+value.no+'">'+'댓글번호 : '+value.no;
                if(value.fleg == 'Y'){
                	a += '/ 작성자 : '+value.writer;
                	if(value.writer == writer){
		                a += '<a onclick="commentUpdate('+value.no+',\''+value.content+'\');"> 수정 </a>';
		                a += '<a onclick="commentDelete('+value.no+');"> 삭제 </a>';
                	}
	                if(value.depth == 0){
	                	a += '<a onclick="commentReply('+value.no+');"> 답변 </a>';
	                }
                }
                a += '</div>';
                a += '<div class="commentContent'+value.no+'"id="reply'+value.no+'"><p>'+value.content+'</p>';
                a += '</div></div><div id="commentInReply'+value.no+'"></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/home/board/insertreply.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(boardNo); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(no, content){
    var a ='';
    var str = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
    a += '<div class="input-group">';
    a += '<textarea class="form-control" id="content" name="content_'+no+'">'+str+'</textarea>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+no+');">수정</button>';
    a += '<button class="btn btn-default" type="button" onclick="commentCancle('+no+',\''+content+'\');">취소</button></span>';
    a += '</div>';
    
    $('.commentContent'+no).html(a);
    
}
 
//댓글 수정 취소
function commentCancle(no, content){
    var a ='';
    
    a += '<p>'+content+'</p>';
    
    $('.commentContent'+no).html(a);
    
}

//댓글 수정
function commentUpdateProc(no){
    var updateContent = $('[name=content_'+no+']').val().replace(/\n/g, '<br/>');
    
    $.ajax({
        url : '/home/board/updatereply.do',
        type : 'post',
        data : {'content' : updateContent, 'no' : no},
        success : function(data){
            if(data == 1) commentList(boardNo); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(no){
    $.ajax({
        url : '/home/board/deletereply/'+no+'.do',
        type : 'post',
        success : function(data){
            if(data == 1) commentList(boardNo); //댓글 삭제후 목록 출력 
        }
    });
}

//대댓글 
function commentReply(no){
    var a ='';
    
    a += '<div id="replyDialog">';
    a += '<form name="commentReplyForm" onsubmit="return false;">';
    a += '<input type="hidden" name="writer" value="'+writer+'"/>';
    a += '<input type="hidden" name="board_no" value="'+boardNo+'"/>';
    a += '<input type="hidden" name="parent" value="'+no+'"/>';
    a += '<textarea class="form-control" id="Replycontent" name="content" placeholder="내용을 입력하세요."></textarea>';
    a += '<button class="btn btn-default" type="button" onclick="commentReplyInsert();">등록</button>';
    a += '<button class="btn btn-default" type="button" onclick="commentReplyCancle();">취소</button>';
    a += '</form></div>';
    
    $('#commentInReply'+no).html(a);
}

//대댓글 등록
function commentReplyInsert(insertData){
	var insertData = $('[name=commentReplyForm]').serialize();
    $.ajax({
        url : '/home/board/insertreply.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(boardNo); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}

//대댓글 취소
function commentReplyCancle(){
	$("#replyDialog").remove();
}


$(document).ready(function(){
    commentList(boardNo); //페이지 로딩시 댓글 목록 출력 
});
 
</script>
  
</body>
