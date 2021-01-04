<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  margin: auto;
  width : 500px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #666;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>


<form action = "/home/signuppro.do" method = "post">
	<sec:csrfInput/>
	<div class ="container">
		<h1>회원가입</h1>
		<p>계정을 만들려면 양식에 따라 작성해주세요.</p>
		<hr>
		
		<label for ="id"><b>아이디</b></label>
		<input type ="text" placeholder= "아이디를 입력해주세요" name = "id" required>
		
		<label for ="pw"><b>비밀번호</b></label>
		<input type ="password" placeholder= "바밀번호를 입력해주세요" name ="pw" required>
		
		<label for ="pw-check"><b>비밀번호 확인</b></label>
		<input type ="password" placeholder= "비밀번호를 한번 더 입력해주세요" name ="pw-check" required>
		
		<label for ="name"><b>이름</b></label>
		<input type ="text" placeholder= "이름을 입력해주세요" name = "name" required>		
		
		<label for ="email"><b>이메일</b></label>
		<input type ="text" placeholder= "이메일를 입력해주세요" name ="email" required>
    	
		<hr>
		<p>계정을 생성함으로써 저희의 <a href="#" style="color:dodgerblue">약관 및 개인정보 보호 정책</a>에</p>
		<p>동의하는것입니다.</p>
		
		<button type="submit" class="registerbtn">회원가입</button>

		<div class="signin">
    		<p>이미 계정이 있습니까? <a href="#">로그인</a></p>
 		</div>
 	</div>
</form>