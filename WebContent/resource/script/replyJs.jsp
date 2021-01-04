<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
var boardNo = '${dto.no}'; //게시글 번호
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// ajax 토큰
$(function() {
	if(token && header){
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	}
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
	                a += '<a onclick="commentUpdate('+value.no+',\''+value.content+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.no+');"> 삭제 </a>';
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