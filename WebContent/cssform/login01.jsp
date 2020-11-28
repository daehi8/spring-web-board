<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
form{
	max-width : 500px;
	margin : auto;
	border : 3px solid #f1f1f1;
}
input[type=text], input[type=password]{
	width :100%;
	padding: 12px 20px;
	margin : 8px 0;
	display : inline-block;
	border : 1px solid #ccc;
	box-sizing : boder-box;
}
button{
	background-color : #aaa;
	color : black;
	padding : 14px 20px;
	margin : 8px 0;
	border : none;
	cursor : pointer;
	width: 100%;
}
button:hover {
	opacity : 0.8;
}
.cancel{
	width : auto;
	padding : 10px 18px;
	background-color : #aaa;
}
.container {
	padding: 16px;
}
span.forget{
	float : right;
	padding-top : 16px;
}    

</style>    

<form  method = "post">
	<div class="container">
		<label for="id"><b>아이디</b></label>
		<input type="text" placeholder="아이디를 입력해주세요" name="id"
		required>
		
		<label for="pw"><b>비밀번호</b></label>
		<input type ="password" placeholder ="비밀번호를 입력해주세요" name ="pw"
		required>
		
		<button type="submit">로그인</button>
		<label>
			<input type="checkbox" name ="auto"> 자동로그인
		</label>
	</div>
	
	<div class="container" style ="background-color:#f1f1f1">
		<button type="button" class="cancel">취소</button>
		<span class="forget"><a href='#'>아이디</a> / <a href='#'>비밀번호</a>를 잊으셨습니까?</span>
	</div>
</form>