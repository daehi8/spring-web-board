<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #666;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  opacity: 0.9;
}

input[type=submit]:hover {
  opacity: 1;
}

.container {
  width: 800px;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
<script>
	function check(){
		var form = document.writeform;
		
		if(form.subject.value == ''){
			alert('제목을 입력해주세요.');
			form.after.focus();
			return false;
		}
		
		if(form.content.value == ''){
			alert('내용을 입력해주세요.');
			form.after.focus();
			return false;
		}
		form.submit();
	}
</script>
<h3>글쓰기</h3>

<div class="container">
  	<form method = "post" name = "writeform" action = "/home/board/writepro.do?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
  		<sec:authentication property="principal" var="user"/>
  		<sec:csrfInput/>
  		<input type="hidden" name="writer" value="${user.username}">
	  	<input type="hidden" name="no" value="${dto.no}">
		<input type="hidden" name="ref" value="${dto.ref}">
		<input type="hidden" name="re_step" value="${dto.re_step}">
		<input type="hidden" name="re_level" value="${dto.re_level}">
		
	    <label for="subject">제목</label>
	    <c:if test="${dto.no == 0}">
	    	<input type="text" id="subject" name="subject" placeholder="제목">
		</c:if>
		<c:if test="${dto.no != 0}">
			<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
		</c:if>
		
		<input type="file" name="save"/>
		
	    <label for="content">내용</label>
	    <textarea id="content" name="content" placeholder="내용을 적어주세요" style="height:200px"></textarea>
	
	    <button type="button" onclick="check();">글쓰기</button>
	</form>
</div>
</body>
</html>
